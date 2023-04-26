import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:login_interface/modules/survey/filter/widgets/filter_date_picker.dart';
import 'package:login_interface/modules/survey/my_shops/widgets/shop_custom_back_button.dart';
import 'package:login_interface/modules/widgets/default_button.dart';
import 'package:login_interface/theme/color_manager.dart';
import 'package:login_interface/utils/resources/image_paths.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController fromDateController = TextEditingController();
    TextEditingController toDateController = TextEditingController();
    var dateFormKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Filter"),
        leading: const ShopCustomBackButton(),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: dateFormKey,
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
                          showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2020),
                                  lastDate: DateTime(2024))
                              .then((value) {
                            fromDateController.text =
                                DateFormat.yMd().format(value!);
                          });
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
                          showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2020),
                                  lastDate: DateTime(2024))
                              .then((value) {
                            toDateController.text =
                                DateFormat.yMd().format(value!);
                          });
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
                        onTap: () {},
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: DefaultButton(
                        text: "Apply",
                        onTap: () {
                          dateFormKey.currentState!.validate();
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
