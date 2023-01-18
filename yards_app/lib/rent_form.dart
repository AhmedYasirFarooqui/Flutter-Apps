// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
// import 'package:yards_app/bottom-tab-bar-screens/items.dart';
// import 'package:yards_app/boats_information.dart';

// import 'checkout.dart';

class RentForm extends StatefulWidget {
  const RentForm({super.key, this.shipName, this.rent, this.image});
  final String? shipName;
  final String? rent;
  final String? image;

  @override
  State<RentForm> createState() => _RentFormState();
}

enum IsOvernight { yes, no }

extension ParseToString on IsOvernight {
  String toShortString() {
    return toString().split('.').last;
  }
}

class _RentFormState extends State<RentForm> {
  TextEditingController controller = TextEditingController();
  TextEditingController anotherController = TextEditingController();
  IsOvernight? _isOvernight = IsOvernight.yes;
  String? selectedFromDate = 'choose date...';
  String? selectedToDate = 'choose date...';
  String? selectedTime;
  String? fromtime = 'choose time...';
  String? totime = 'choose time...';
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    List<Map> information = [
      {
        'ship name': widget.shipName,
        'rent': widget.rent,
        'duration': controller.text,
        'people': anotherController,
        'overnight': _isOvernight.toString(),
        'fromdate': selectedFromDate,
        'todate': selectedToDate,
        'fromtime': fromtime,
        'totime': totime,
      }
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF163257),
        elevation: 0.0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        // leading: InkWell(
        //   onTap: () {
        //     // showDialog<void>(
        //     //   context: context,
        //     //   barrierDismissible: true, // user must tap button!
        //     //   builder: (BuildContext context) {
        //     //     return AlertDialog(
        //     //       title: Text(
        //     //         'Are you sure?',
        //     //         style: TextStyle(
        //     //           color: Color(0xFF163257),
        //     //           fontSize: 18.0,
        //     //           fontWeight: FontWeight.bold,
        //     //         ),
        //     //       ),
        //     //       content: SingleChildScrollView(
        //     //         child: Text(
        //     //           'All your data will be removed once you go back.',
        //     //           style: TextStyle(
        //     //             color: Color(0xFF163257),
        //     //             fontSize: 16.0,
        //     //           ),
        //     //         ),
        //     //       ),
        //     //       actions: [
        //     //         TextButton(
        //     //           child: const Text(
        //     //             'ok',
        //     //             style: TextStyle(
        //     //               color: Color(0xFF163257),
        //     //               fontSize: 16.0,
        //     //             ),
        //     //           ),
        //     //           onPressed: () {
        //     //             Navigator.pop(context);
        //     //           },
        //     //         ),
        //     //       ],
        //     //     );
        //     //   },
        //     // );
        //     Navigator.pop(context);
        //   },
        //   child: Center(
        //     child: Text('Back'),
        //   ),
        // ),
        title: Text(
          'Rent Inquery',
          textAlign: TextAlign.justify,
          softWrap: true,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height / 30,
            ),
            // Row(
            //   children: [
            //     SizedBox(
            //       width: width / 30,
            //     ),
            //     Text(
            //       'Ship Name',
            //       textAlign: TextAlign.justify,
            //       softWrap: true,
            //       style: TextStyle(
            //         color: Color(0xFF163257),
            //         fontSize: 18.0,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   ],
            // ),
            // Row(
            //   children: [
            //     SizedBox(
            //       width: width / 30,
            //     ),
            //     Text(
            //       widget.shipName!,
            //       textAlign: TextAlign.justify,
            //       softWrap: true,
            //       style: TextStyle(
            //         color: Color(0xFF163257),
            //         fontSize: 16.0,
            //         // fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   ],
            // ),
            // SizedBox(
            //   height: height / 60,
            // ),
            // Row(
            //   children: [
            //     SizedBox(
            //       width: width / 30,
            //     ),
            //     Text(
            //       'Rent',
            //       textAlign: TextAlign.justify,
            //       softWrap: true,
            //       style: TextStyle(
            //         color: Color(0xFF163257),
            //         fontSize: 18.0,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   ],
            // ),
            // Row(
            //   children: [
            //     SizedBox(
            //       width: width / 30,
            //     ),
            //     Text(
            //       widget.rent!,
            //       textAlign: TextAlign.justify,
            //       softWrap: true,
            //       style: TextStyle(
            //         color: Color(0xFF163257),
            //         fontSize: 16.0,
            //         // fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   ],
            // ),
            Row(
              children: [
                SizedBox(
                  width: width / 30,
                ),
                Text(
                  'Duration (Hours)',
                  textAlign: TextAlign.justify,
                  softWrap: true,
                  style: TextStyle(
                    color: Color(0xFF163257),
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: width / 8.5),
                SizedBox(
                  width: width / 4,
                  child: NumberInputWithIncrementDecrement(
                    buttonArrangement: ButtonArrangement.incLeftDecRight,
                    separateIcons: true,
                    incIconSize: 20.0,
                    decIconSize: 20.0,
                    incIcon: Icons.add,
                    decIcon: Icons.remove,
                    incIconColor: Colors.white,
                    decIconColor: Colors.white,
                    scaleHeight: 1,
                    incIconDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.0),
                      color: Color(0xFF163257),
                    ),
                    decIconDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.0),
                      color: Color(0xFF163257),
                    ),
                    isInt: true,
                    controller: controller,
                    numberFieldDecoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                    widgetContainerDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: Colors.transparent,
                      ),
                    ),
                    min: 0,
                    max: 48,
                  ),
                ),
              ],
            ),
            // SizedBox(
            //   height: height / 100,
            // ),
            Row(
              children: [
                SizedBox(
                  width: width / 30,
                ),
                Text(
                  'Number of People',
                  textAlign: TextAlign.justify,
                  softWrap: true,
                  style: TextStyle(
                    color: Color(0xFF163257),
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: width / 12,
                ),
                SizedBox(
                  width: width / 4,
                  child: NumberInputWithIncrementDecrement(
                    buttonArrangement: ButtonArrangement.incLeftDecRight,
                    separateIcons: true,
                    incIconSize: 20.0,
                    decIconSize: 20.0,
                    incIcon: Icons.add,
                    decIcon: Icons.remove,
                    incIconColor: Colors.white,
                    decIconColor: Colors.white,
                    scaleHeight: 1,
                    incIconDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.0),
                      color: Color(0xFF163257),
                    ),
                    decIconDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.0),
                      color: Color(0xFF163257),
                    ),
                    isInt: true,
                    controller: anotherController,
                    numberFieldDecoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                    widgetContainerDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: Colors.transparent,
                      ),
                    ),
                    min: 0,
                    max: 48,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: width / 30,
            ),
            Row(
              children: [
                SizedBox(
                  width: width / 30,
                ),
                Text(
                  'Overnight',
                  textAlign: TextAlign.justify,
                  softWrap: true,
                  style: TextStyle(
                    color: Color(0xFF163257),
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: const Text('Yes'),
                    leading: Radio<IsOvernight>(
                      value: IsOvernight.yes,
                      groupValue: _isOvernight,
                      onChanged: (IsOvernight? value) {
                        setState(
                          () {
                            _isOvernight = value;
                          },
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: const Text('No'),
                    leading: Radio<IsOvernight>(
                      value: IsOvernight.no,
                      groupValue: _isOvernight,
                      onChanged: (IsOvernight? value) {
                        setState(
                          () {
                            _isOvernight = value;
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: height / 60),
            Row(
              children: [
                SizedBox(
                  width: width / 30,
                ),
                Text(
                  'Scheduled Date',
                  textAlign: TextAlign.justify,
                  softWrap: true,
                  style: TextStyle(
                    color: Color(0xFF163257),
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: height / 70),
            Row(
              children: [
                SizedBox(width: width / 20),
                Text(
                  'From',
                  textAlign: TextAlign.justify,
                  softWrap: true,
                  style: TextStyle(
                    color: Color(0xFF163257),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: width / 20),
                Container(
                  height: height / 20,
                  width: width / 1.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: Color(0xFF163257),
                    ),
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        SizedBox(width: width / 50),
                        InkWell(
                          onTap: () async {
                            DateTime? newdate = await showDatePicker(
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                              context: context,
                            );
                            setState(
                              () {
                                if (newdate != null) {
                                  if (newdate.isBefore(
                                    DateTime.now(),
                                  )) {
                                    showDialog<void>(
                                      context: context,
                                      barrierDismissible:
                                          false, // user must tap button!
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text(
                                            'Invalid Date',
                                            style: TextStyle(
                                              color: Color(0xFF163257),
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          content: SingleChildScrollView(
                                            child: Text(
                                              'Please choose another date.',
                                              style: TextStyle(
                                                color: Color(0xFF163257),
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ),
                                          actions: [
                                            TextButton(
                                              child: const Text(
                                                'ok',
                                                style: TextStyle(
                                                  color: Color(0xFF163257),
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  } else {
                                    selectedFromDate =
                                        DateFormat('EEEE, d MMM, yyyy')
                                            .format(newdate);
                                  }
                                }
                              },
                            );
                          },
                          child: const Icon(
                            Icons.calendar_month,
                            color: Color(0xFF163257),
                            size: 25.0,
                          ),
                        ),
                        SizedBox(
                          width: width / 50,
                        ),
                        Text(
                          '$selectedFromDate',
                          style: TextStyle(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: height / 70),
            Row(
              children: [
                SizedBox(width: width / 20),
                Text(
                  'To',
                  textAlign: TextAlign.justify,
                  softWrap: true,
                  style: TextStyle(
                    color: Color(0xFF163257),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: width / 10),
                Container(
                  height: height / 20,
                  width: width / 1.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: Color(0xFF163257),
                    ),
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        SizedBox(width: width / 40),
                        InkWell(
                          onTap: () async {
                            DateTime? newdate = await showDatePicker(
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                              context: context,
                            );
                            setState(
                              () {
                                if (newdate != null) {
                                  if (newdate.isBefore(
                                    DateTime.now(),
                                  )) {
                                    showDialog<void>(
                                      context: context,
                                      barrierDismissible:
                                          false, // user must tap button!
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text(
                                            'Invalid Date',
                                            style: TextStyle(
                                              color: Color(0xFF163257),
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          content: SingleChildScrollView(
                                            child: Text(
                                              'Please choose another date.',
                                              style: TextStyle(
                                                color: Color(0xFF163257),
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ),
                                          actions: [
                                            TextButton(
                                              child: const Text(
                                                'ok',
                                                style: TextStyle(
                                                  color: Color(0xFF163257),
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  } else {
                                    selectedToDate =
                                        DateFormat('EEEE, d MMM, yyyy')
                                            .format(newdate);
                                  }
                                }
                              },
                            );
                          },
                          child: const Icon(
                            Icons.calendar_month,
                            color: Color(0xFF163257),
                            size: 25.0,
                          ),
                        ),
                        SizedBox(
                          width: width / 50,
                        ),
                        Text(
                          '$selectedToDate',
                          style: TextStyle(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: height / 30),
            Row(
              children: [
                SizedBox(
                  width: width / 30,
                ),
                Text(
                  'Scheduled Time',
                  textAlign: TextAlign.justify,
                  softWrap: true,
                  style: TextStyle(
                    color: Color(0xFF163257),
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: height / 60),
            Row(
              children: [
                Row(
                  children: [
                    SizedBox(width: width / 20),
                    Text(
                      'From',
                      textAlign: TextAlign.justify,
                      softWrap: true,
                      style: TextStyle(
                        color: Color(0xFF163257),
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: width / 20),
                    Container(
                      height: height / 20,
                      width: width / 1.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: Color(0xFF163257),
                        ),
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            SizedBox(width: width / 40),
                            InkWell(
                              onTap: () async {
                                TimeOfDay? newtime = await showTimePicker(
                                  initialTime: TimeOfDay.now(),
                                  context: context,
                                );
                                setState(
                                  () {
                                    if (newtime != null) {
                                      fromtime = newtime.format(context);
                                    } else {
                                      fromtime = TimeOfDay.now().toString();
                                    }
                                  },
                                );
                              },
                              child: const Icon(
                                Icons.timer_sharp,
                                color: Color(0xFF163257),
                                size: 25.0,
                              ),
                            ),
                            SizedBox(width: width / 50),
                            Text(
                              fromtime!,
                              style: TextStyle(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: height / 60),
            Row(
              children: [
                Row(
                  children: [
                    SizedBox(width: width / 20),
                    Text(
                      'To',
                      textAlign: TextAlign.justify,
                      softWrap: true,
                      style: TextStyle(
                        color: Color(0xFF163257),
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: width / 9.5),
                    Container(
                      height: height / 20,
                      width: width / 1.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: Color(0xFF163257),
                        ),
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            SizedBox(width: width / 40),
                            InkWell(
                              onTap: () async {
                                TimeOfDay? newtime = await showTimePicker(
                                  initialTime: TimeOfDay.now(),
                                  context: context,
                                );
                                setState(
                                  () {
                                    if (newtime != null) {
                                      totime = newtime.format(context);
                                    } else {
                                      totime = TimeOfDay.now().toString();
                                    }
                                  },
                                );
                              },
                              child: const Icon(
                                Icons.timer_sharp,
                                color: Color(0xFF163257),
                                size: 25.0,
                              ),
                            ),
                            SizedBox(width: width / 50),
                            Text(
                              totime!,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: height / 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: width / 3,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      backgroundColor: Color(0xFF163257),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ),
                SizedBox(width: width / 30),
                SizedBox(
                  width: width / 3,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      backgroundColor: Color(0xFF163257),
                    ),
                    onPressed: () {
                      showDialog<void>(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              'Request Sent',
                              style: TextStyle(
                                color: Color(0xFF163257),
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            content: SingleChildScrollView(
                              child: Text(
                                "We'll keep you updated wth your request.",
                                style: TextStyle(
                                  color: Color(0xFF163257),
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                            actions: [
                              TextButton(
                                child: const Text(
                                  'ok',
                                  style: TextStyle(
                                    color: Color(0xFF163257),
                                    fontSize: 16.0,
                                  ),
                                ),
                                onPressed: () {
                                  information.add(
                                    {
                                      'ship name': widget.shipName,
                                      'rent': widget.rent,
                                      'duration': controller.text,
                                      'people': anotherController,
                                      'overnight': _isOvernight.toString(),
                                      'fromdate': selectedFromDate,
                                      'todate': selectedToDate,
                                      'fromtime': fromtime,
                                      'totime': totime,
                                    },
                                  );
                                  // Navigator.of(context).push(
                                  //   MaterialPageRoute(
                                  //     builder: (context) => ItemsScreen(
                                  //       shipsName: widget.shipName!,
                                  //       rent: widget.rent!,
                                  //       duration: controller.text,
                                  //       people: anotherController.text,
                                  //       overnight:
                                  //           _isOvernight!.toShortString(),
                                  //       fromdate: selectedFromDate,
                                  //       todate: selectedToDate,
                                  //       fromtime: fromtime,
                                  //       totime: totime,
                                  //     ),
                                  //   ),
                                  // );
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                      // debugPrint(controller.text);
                      // debugPrint(anotherController.text);
                      // debugPrint(_isOvernight!.toShortString());
                      // debugPrint(selectedFromDate);
                      // debugPrint(selectedToDate);
                      // debugPrint(fromtime);
                      // debugPrint(totime);
                    },
                    child: const Text(
                      'Proceed',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
