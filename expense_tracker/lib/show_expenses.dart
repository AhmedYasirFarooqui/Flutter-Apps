// ignore_for_file: prefer_const_constructors, unused_import, must_be_immutable

// import 'dart:developer';

import 'dart:developer';

import 'package:expense_tracker/add_expenses.dart';
import 'package:expense_tracker/controllers/add_expens.dart';
import 'package:expense_tracker/modal.dart';
import 'package:expense_tracker/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MyHomePage extends GetView<AddExpenseController> {
  MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('build 2');
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          SizedBox(height: Get.width * 0.2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  controller.income != null && controller.income!.isNotEmpty
                      ? Obx(() => Text('Income: ${controller.totalIncome}'))
                      : Text('Income: 0'),
                  controller.expenses != null && controller.expenses!.isNotEmpty
                      ? Obx(() => Text('Expenses: ${controller.totalExpenses}'))
                      : Text('Expenses: 0'),
                ],
              ),
              Column(
                children: [
                  Buttons(
                    buttonText: 'Add',
                    onPressed: () => Get.to(() => AddExpenses()),
                    color: Colors.blue,
                    textColor: Colors.white,
                  ),
                  Buttons(
                    buttonText: 'Delete',
                    onPressed: () => controller.delete(),
                    color: Colors.blue,
                    textColor: Colors.white,
                  ),
                ],
              ),
            ],
          ),
          ShowData(),
        ],
      ),
    );
  }
}

class ShowData extends StatelessWidget {
  const ShowData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddExpenseController>();
    log('build show data');
    return controller.data!.isNotEmpty
        ? GetBuilder<AddExpenseController>(
            init: controller,
            builder: (controller) {
              return Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  itemCount: controller.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.15,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                shape: BoxShape.circle,
                              ),
                              width: Get.width * 0.15,
                              height: Get.height * 0.15,
                              child: controller.data![index].typeOfAmount ==
                                      'Expenses'
                                  ? Icon(
                                      Icons.arrow_back,
                                      color: Colors.red,
                                      size: 25.0,
                                    )
                                  : Icon(
                                      Icons.arrow_forward,
                                      color: Colors.green,
                                      size: 25.0,
                                    ),
                            ),
                            SizedBox(
                              width: Get.width * 0.5,
                              // color: Colors.grey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    // '${widget.data![index][index][0]['title']}',
                                    controller.data![index].title!,

                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  SizedBox(height: 4.0),
                                  Text(
                                    controller.data![index].description!,
                                    style: TextStyle(
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                  SizedBox(height: 2.0),
                                  Text(
                                    // '${widget.data![index][index][0]['selectedDate']} at ${widget.data![index][index]['selectedTime']}',
                                    '${controller.data![index].selectedDate!} at ${controller.data![index].selectedTime!}',
                                    style: TextStyle(
                                      color: Colors.grey[300],
                                      fontSize: 11.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.2,
                              child: Center(
                                child: Text(
                                  // widget.data![index][index][0]['amount']
                                  //     .toString(),
                                  controller.data![index].amount!.toString(),
                                  softWrap: true,
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          )
        : Center(
            child: Text(
              'Nothing to show.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
              ),
            ),
          );
  }
}
