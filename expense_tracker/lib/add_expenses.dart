// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors, prefer_typing_uninitialized_variables, unused_field, unused_import, unused_local_variable, use_build_context_synchronously, must_be_immutable

import 'dart:developer';
import 'package:expense_tracker/controllers/add_expens.dart';
import 'package:expense_tracker/modal.dart';
import 'package:expense_tracker/widgets/buttons.dart';
import 'package:expense_tracker/widgets/text_field.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'show_expenses.dart';

class AddExpenses extends GetView<AddExpenseController> {
  AddExpenses({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    log('build expense');
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.add(
            title1: controller.title,
            description1: controller.description,
            amount1: controller.amount,
            selectedDate1: controller.selectedDate,
            selectedTime1: controller.selectedTime,
            typeOfAmount1: controller.dropdownValue,
          );
          Get.to(() => MyHomePage());
        },
        elevation: 0.0,
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Enter Information',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: Colors.blue[700],
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          TextFields(
            controller: titleController,
            onChanged: (mytitle) {
              controller.handleTitle(title: mytitle);
            },
            hinttext: 'Title',
            readOnly: false,
            maxlines: 1,
          ),
          SizedBox(height: 8.0),
          TextFields(
            controller: descriptionController,
            onChanged: (mydescription) {
              controller.handleDescription(description: mydescription);
            },
            hinttext: 'Description',
            readOnly: false,
            maxlines: 5,
          ),
          SizedBox(height: 8.0),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: InkWell(
                  onTap: () async {
                    DateTime? newdate = await showDatePicker(
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                      context: context,
                    );

                    controller.handleSelected(
                      date: DateFormat('d MMM, yyyy').format(newdate!),
                    );
                  },
                  child: Container(
                    width: Get.width * 0.14,
                    height: Get.height * 0.065,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Icon(
                      Icons.calendar_month,
                      color: Colors.grey,
                      size: 30.0,
                    ),
                  ),
                ),
              ),
              Container(
                height: Get.height * 0.065,
                width: Get.width * 0.79,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 10.0),
                    Obx(
                      () => Text(controller.selectedDate),
                    ),
                    SizedBox(),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: InkWell(
                  onTap: () async {
                    TimeOfDay? newtime = await showTimePicker(
                      initialTime: TimeOfDay.now(),
                      context: context,
                    );
                    if (newtime != null) {
                      controller.handleSelectedTime(
                        time: newtime.format(context),
                      );
                    } else {
                      controller.handleSelectedTime(
                        time: TimeOfDay.now().toString(),
                      );
                    }
                  },
                  child: Container(
                    width: Get.width * 0.14,
                    height: Get.height * 0.065,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Icon(
                      Icons.timer_sharp,
                      color: Colors.grey,
                      size: 30.0,
                    ),
                  ),
                ),
              ),
              Container(
                height: Get.height * 0.065,
                width: Get.width * 0.79,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 10.0),
                    Obx(
                      () => Text(controller.selectedTime),
                    ),
                    SizedBox(),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9.0),
            child: Container(
              height: 50.0,
              width: 60.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: const EdgeInsets.all(9.0),
              child: Obx(
                () => DropdownButton<String>(
                  borderRadius: BorderRadius.circular(10.0),
                  isExpanded: true,
                  value: controller.dropdownValue,
                  icon: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 30.0,
                  ),
                  dropdownColor: Colors.white,
                  elevation: 16,
                  style: const TextStyle(color: Colors.black),
                  underline: Container(
                    height: 2,
                    color: Colors.transparent,
                  ),
                  onChanged: (String? newValue) {
                    controller.handleDropDownValue(dropdown: newValue);
                    // setState(() {
                    //   dropdownValue!.value = newValue!;
                    // });
                  },
                  items: <String>[
                    'Expenses',
                    'Income',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          SizedBox(height: 8.0),
          TextFields(
            controller: amountController,
            hinttext: 'Amount',
            maxlines: 1,
            onChanged: (value) {},
            readOnly: true,
          ),
          SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: GetBuilder<AddExpenseController>(
              init: AddExpenseController(),
              builder: (controller) {
                return GridView.builder(
                  shrinkWrap: true,
                  itemCount: controller.options.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 2,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    if (controller.options[index] == 'Delete') {
                      return Buttons(
                        color: Colors.red,
                        textColor: Colors.white,
                        onPressed: () {
                          String amount = amountController.text
                              .substring(0, amountController.text.length - 1);
                          amountController.text = amount;
                          // controller.handleAmount(
                          //   amount: amount,
                          // );
                        },
                        buttonText: controller.options[index],
                      );
                    } else {
                      return Buttons(
                        color: Colors.white,
                        textColor: Colors.black,
                        onPressed: () {
                          amountController.text += controller.options[index];
                          controller.handleAmount(
                              amount: int.parse(amountController.text));
                        },
                        buttonText: controller.options[index],
                      );
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
