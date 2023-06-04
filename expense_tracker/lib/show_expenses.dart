// ignore_for_file: prefer_const_constructors, unused_import, must_be_immutable, unused_local_variable

// import 'dart:developer';

import 'dart:developer';
import 'package:expense_tracker/show_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:expense_tracker/add_expenses.dart';
import 'package:expense_tracker/controllers/add_expens.dart';
import 'package:expense_tracker/modal.dart';
import 'package:expense_tracker/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    log('build 2');
    final controller = Provider.of<AddExpenseController>(context);
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          SizedBox(height: height * 0.2),
          // Consumer<AddExpenseController>(
          //   builder: (context, value, child) {
          //     return SfCircularChart(
          //       title: ChartTitle(text: 'Pie Chart'),
          //       legend: Legend(isVisible: true),
          //       series: [
          //         PieSeries(
          //           radius: '40%',
          //           dataSource: controller.data,
          //           xValueMapper: (dynamic data, int index) =>
          //               value.income.toString(),
          //           yValueMapper: (dynamic data, int index) => value.amount,
          //         ),
          //       ],
          //     );
          //   },
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: width * 0.6,
                height: height * 0.07,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    controller.income != null && controller.income!.isNotEmpty
                        ? Consumer<AddExpenseController>(
                            builder: (context, value, child) {
                              return Text(
                                'Income: ${value.totalIncome}',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            },
                          )
                        : Text(
                            'Income: 0',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                    SizedBox(height: 5),
                    controller.expenses != null &&
                            controller.expenses!.isNotEmpty
                        ? Consumer<AddExpenseController>(
                            builder: (context, value, child) {
                              return Text(
                                'Expenses: ${value.totalExpenses}',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            },
                          )
                        : Text(
                            'Expenses: 0',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ],
                ),
              ),
              SizedBox(width: 30),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Buttons(
                    buttonText: 'Add',
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => AddExpenses(),
                      ),
                    ),
                    color: Colors.blue,
                    textColor: Colors.white,
                  ),
                  SizedBox(height: 5.0),
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
