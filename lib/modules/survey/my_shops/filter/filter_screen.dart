// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io' show Platform;
import 'package:intl/intl.dart';
import 'package:login_interface/modules/survey/my_shops/bloc/shops_bloc.dart';
import 'package:login_interface/modules/survey/my_shops/bloc/shops_events.dart';
import 'package:login_interface/modules/survey/my_shops/filter/widgets/filter_date_picker.dart';
import 'package:login_interface/modules/survey/my_shops/widgets/shop_custom_back_button.dart';
import 'package:login_interface/modules/widgets/default_button.dart';
import 'package:login_interface/theme/color_manager.dart';
import 'package:login_interface/utils/resources/image_paths.dart';

class FilterScreen extends StatelessWidget {
  FilterScreen({super.key});

  TextEditingController fromDateController = TextEditingController();

  TextEditingController toDateController = TextEditingController();

  DateTime currentDate = DateTime.now();

  var fromDateFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Filter"),
        leading: const ShopCustomBackButton(),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: fromDateFormKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: FilterDatePicker(
                        controller: fromDateController,
                        hintText: 'From',
                        suffixIcon: ImagePaths.calendar,
                        onTap: () {
                          if (Platform.isIOS) {
                            showCupertinoModalPopup(
                                context: context,
                                builder: (context) => Container(
                                      color: Colors.white,
                                      child: SizedBox(
                                        height: 250,
                                        child: CupertinoDatePicker(
                                            backgroundColor: Colors.white,
                                            mode: CupertinoDatePickerMode.date,
                                            initialDateTime: currentDate,
                                            onDateTimeChanged: (newDate) {
                                              fromDateController.text =
                                                  DateFormat.yMd()
                                                      .format(newDate);
                                            }),
                                      ),
                                    ));
                          } else if (Platform.isAndroid) {
                            showDatePicker(
                                    context: context,
                                    initialDate: currentDate,
                                    firstDate: DateTime(2020),
                                    lastDate: DateTime(2024))
                                .then((value) {
                              fromDateController.text =
                                  DateFormat.yMd().format(value ?? currentDate);
                            });
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: FilterDatePicker(
                        controller: toDateController,
                        hintText: 'To',
                        suffixIcon: ImagePaths.calendar,
                        onTap: () {
                          if (Platform.isIOS) {
                            showCupertinoModalPopup(
                              context: context,
                              builder: (context) => SizedBox(
                                height: 250,
                                child: CupertinoDatePicker(
                                    backgroundColor: Colors.white,
                                    mode: CupertinoDatePickerMode.date,
                                    initialDateTime: currentDate,
                                    onDateTimeChanged: (newDate) {
                                      toDateController.text =
                                          DateFormat.yMd().format(newDate);
                                    }),
                              ),
                            );
                          } else if (Platform.isAndroid) {
                            showDatePicker(
                                    context: context,
                                    initialDate: currentDate,
                                    firstDate: DateTime(2020),
                                    lastDate: DateTime(2024))
                                .then((value) {
                              toDateController.text =
                                  DateFormat.yMd().format(value ?? currentDate);
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: DefaultButton(
                        text: "Clear",
                        backgroundColor:
                            ColorManager.defaultButtonBackgroundColor,
                        textColor: Colors.black,
                        onTap: () {
                          fromDateController.clear();
                          toDateController.clear();
                          // BlocProvider.of<ShopsBloc>(context)
                          //     .add(ApplyFilterInShopsEvent(
                          //   fromDate: "",
                          //   toDate: "",
                          // ));
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: DefaultButton(
                        text: "Apply",
                        onTap: () {
                          if (fromDateController.text.isNotEmpty &&
                              toDateController.text.isEmpty) {
                            BlocProvider.of<ShopsBloc>(context).add(
                                FromDateFilterEvent(
                                    fromDate: fromDateController.text));
                          } else if (toDateController.text.isNotEmpty &&
                              fromDateController.text.isEmpty) {
                            BlocProvider.of<ShopsBloc>(context).add(
                                ToDateFilterEvent(
                                    toDate: toDateController.text));
                          } else if (fromDateController.text.isNotEmpty &&
                              toDateController.text.isNotEmpty) {
                            BlocProvider.of<ShopsBloc>(context)
                                .add(BeetweenDatesFilterEvent(
                              fromDate: fromDateController.text,
                              toDate: toDateController.text,
                            ));
                          }

                          // fromDateFormKey.currentState!.validate();
                        },
                      ),
                    ),
                  ],
                ),
                // Text(toDateController.text)
              ],
            ),
          )),
    );
  }
}
