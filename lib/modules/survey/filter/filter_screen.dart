// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:intl/intl.dart';
import 'package:login_interface/modules/survey/filter/widgets/filter_date_picker.dart';
import 'package:login_interface/modules/survey/my_shops/widgets/shop_custom_back_button.dart';
import 'package:login_interface/modules/widgets/default_button.dart';
import 'package:login_interface/theme/color_manager.dart';
import 'package:login_interface/utils/resources/image_paths.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "From Date is Required";
                          } else {
                            return null;
                          }
                        },
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "To Date is Required";
                          } else {
                            return null;
                          }
                        },
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
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: DefaultButton(
                        text: "Apply",
                        onTap: () {
                          fromDateFormKey.currentState!.validate();
                        },
                      ),
                    ),
                  ],
                ),
                Text(toDateController.text)
              ],
            ),
          )),
    );
  }
}
