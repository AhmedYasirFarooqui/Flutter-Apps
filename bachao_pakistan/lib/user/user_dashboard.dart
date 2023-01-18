// ignore_for_file: prefer_const_constructors, unused_local_variable, unused_field, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:bachao_pakistan/custom-widgets/dashboard_buttons.dart';
import 'package:bachao_pakistan/profile.dart';
// import 'package:bachao_pakistan/user/settings.dart';
import 'package:flutter/material.dart';

// import '../modals/ads_modal.dart';
import '../services/ads_service.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({
    super.key,
    this.isapproved,
  });
  final String? isapproved;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int points = 0;
  int start = 10;
  bool? buttonPressed;
  bool? onTapped = false;
  Timer? timer;
  dynamic oneSec = Duration(seconds: 1);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ApiService adsService = ApiService();
  dynamic baseURL = 'https://bachaopakistan.com/demo/public/images';
  List<String> images = [
    'https://bachaopakistan.com/demo/public/images/1663191149.jpeg',
    'https://bachaopakistan.com/demo/public/images/1663334880.jpeg',
  ];
  showtimer() {
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (mounted) {
          if (start == 0) {
            setState(
              () {
                points += 50;
                timer.cancel();
                start = 10;
                Navigator.of(context).pop();
              },
            );
          } else {
            setState(
              () {
                start--;
                debugPrint(
                  start.toString(),
                );
              },
            );
          }
        }
      },
    );
  }

  showImage(String imgPath, int count) {
    return showDialog(
      context: _scaffoldKey.currentContext!,
      barrierDismissible: false,
      builder: (dialogContex) {
        showtimer();
        return AlertDialog(
          elevation: 0.0,
          // title: Center(
          //   child: Text(
          //     '$count',
          //   ),
          // ),
          content: Image(
            image: NetworkImage(imgPath),
          ),
          actions: [
            InkWell(
              onTap: () {
                if (mounted) {
                  timer!.cancel();
                  start = 10;
                  // points = 0;
                  Navigator.of(context).pop();
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Exit',
                  style: TextStyle(
                    color: Color(0xFF207dff),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    adsService.getAds();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // String? isApproved = widget.isapproved;
    images.shuffle();
    // ApiService adsService = ApiService();
    // debugPrint(ads![0].id.toString());
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: const Color(0xFF207dff),
          automaticallyImplyLeading: false,
          elevation: 0.0,
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 20),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProfileScreen(),
                    ),
                  );
                },
                child: Icon(Icons.settings, size: 20.0),
              ),
            ),
          ],
          title: const Text(
            'Dashboard',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none,
            ),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: height / 20),
              Text(
                'Account Status: ${widget.isapproved == 'inactive' ? 'inactive' : 'active'}',
                style: TextStyle(
                  color: Color(0xFF207dff),
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                ),
              ),
              SizedBox(height: height / 20),
              widget.isapproved == 'inactive'
                  ? SizedBox()
                  : DashboardButtons(
                      text: 'Watch Ad',
                      onTap: () {
                        setState(
                          () {
                            buttonPressed = true;
                            // showtimer();
                            showImage(images[0], start);
                          },
                        );
                      },
                    ),
              SizedBox(height: height / 20),
              Text(
                'Points: $points',
                style: TextStyle(
                  color: Color(0xFF207dff),
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                ),
              ),
              // SizedBox(height: height / 50),
              // buttonPressed == true
              //     ? Text(
              //         '$start',
              //         style: TextStyle(
              //           color: Color(0xFF207dff),
              //           fontSize: 20.0,
              //           fontWeight: FontWeight.bold,
              //           decoration: TextDecoration.none,
              //         ),
              //       )
              //     : SizedBox(),
              // // SizedBox(height: height / 50),
              // start == 10
              //     ? SizedBox()
              //     : Column(
              //         children: [
              //           Image(
              //             image: AssetImage('assets/images/work.jpg'),
              //             width: 200.0,
              //             height: 200.0,
              //           ),
              //           InkWell(
              //             onTap: () {
              //               if (mounted) {
              //                 timer!.cancel();
              //                 start = 10;
              //                 points = 0;
              //                 // Navigator.of(context).pop();
              //                 buttonPressed = false;
              //                 onTapped = true;
              //               }
              //             },
              //             child: Padding(
              //               padding: const EdgeInsets.all(8.0),
              //               child: Text(
              //                 'Exit',
              //                 style: TextStyle(
              //                   color: Color(0xFF207dff),
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              // SizedBox(height: height / 6),
              // DashboardButtons(
              //   text: 'Edit Profile',
              //   onTap: () {
              //     Navigator.of(context).push(
              //       MaterialPageRoute(
              //         builder: (context) => ProfileScreen(),
              //       ),
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
