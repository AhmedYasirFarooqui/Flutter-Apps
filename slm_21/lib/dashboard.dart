// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unused_import, sized_box_for_whitespace

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:slm_21/dashboard/health_status.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:slm_21/settings.dart';

import 'buttons.dart';
import 'dashboard/total_animals.dart';
import 'dashboard/vaccination/vaccine.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    // GoogleSignInAccount? _user = _googleSignIn.currentUser;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80.0,
          backgroundColor: Colors.blue[800],
          title: Text(
            'Dashboard',
            style: TextStyle(
                fontSize: 30.0, fontWeight: FontWeight.w600, color: Colors.white
                // color: Colors.blue[800],
                ),
          ),
          actions: [
            InkWell(
              child: Icon(
                Icons.settings,
                size: 20.0,
                color: Colors.white,
              ),
              onTap: () async {
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SettingsPage(),
                  ),
                );
              },
            ),
            SizedBox(
              width: 20.0,
            ),
          ],
        ),
        body: Container(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // SizedBox(
                  //   height: 40.0,
                  // ),
                  // Row(
                  //   children: [
                  //     SizedBox(
                  //       width: 15.0,
                  //     ),
                  //     Text(
                  //       'Dashboard',
                  //       style: TextStyle(
                  //         fontSize: 40.0,
                  //         fontWeight: FontWeight.w600,
                  //         color: Colors.blue[800],
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: 110.0,
                  //     ),
                  //     InkWell(
                  //       child: Icon(
                  //         Icons.settings,
                  //         size: 20.0,
                  //         color: Colors.blue[800],
                  //       ),
                  //       onTap: () async {
                  //         await Navigator.of(context).push(
                  //           MaterialPageRoute(
                  //             builder: (context) => SettingsPage(),
                  //           ),
                  //         );
                  //       },
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 50.0,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DashboardOptions(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => HealthStatus(),
                            ),
                          );
                        },
                        text: 'Health Status',
                        imgPath: 'assets/images/hr.png',
                      ),
                      DashboardOptions(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => VaccinePage(),
                            ),
                          );
                        },
                        text: 'Vaccination',
                        imgPath: 'assets/images/vaccinated-icon.png',
                      ),
                    ],
                  ),
                  DashboardOptions(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TotalAnimals(),
                      ),
                    ),
                    text: 'Total Animals',
                    imgPath: 'assets/images/cow.png',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DashboardOptions extends StatefulWidget {
  const DashboardOptions({Key? key, this.onTap, this.text, this.imgPath})
      : super(key: key);
  final String? text;
  final String? imgPath;
  final VoidCallback? onTap;

  @override
  State<DashboardOptions> createState() => _DashboardOptionsState();
}

class _DashboardOptionsState extends State<DashboardOptions> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.height / 3,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 3.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                widget.text.toString(),
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue[800],
                ),
              ),
              SizedBox(
                width: 0.0,
              ),
              Image(
                image: AssetImage(widget.imgPath.toString()),
                width: 70.0,
                height: 70.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
