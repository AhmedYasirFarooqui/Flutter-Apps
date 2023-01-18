// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_unnecessary_containers, unused_local_variable, unused_field, unused_import, unnecessary_null_comparison
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:slm_21/dashboard/body_temperature.dart';
import 'package:slm_21/dashboard/heart_rate.dart';
import 'package:slm_21/dashboard/room_temperature.dart';
import 'package:slm_21/dashboard/spo2.dart';

// import '../main.dart';
// import 'health_data.dart';

class HealthStatus extends StatefulWidget {
  const HealthStatus({Key? key}) : super(key: key);

  @override
  _HealthStatusState createState() => _HealthStatusState();
}

class _HealthStatusState extends State<HealthStatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0,
        backgroundColor: Color.fromRGBO(21, 101, 192, 1),
        title: Text(
          'Health Status',
          style: TextStyle(
              fontSize: 30.0, fontWeight: FontWeight.w600, color: Colors.white
              // color: Colors.blue[800],
              ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            StaggeredGrid.count(
              crossAxisCount: 4,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              children: [
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 3,
                  child: MyContainer(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => BodyTemperature(),
                        ),
                      );
                    },
                    text: 'Body Temperature',
                    imgPath: 'assets/images/temp.png',
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 3,
                  child: MyContainer(
                    text: 'Heart Rate',
                    imgPath: 'assets/images/hr.png',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => HeartRate(),
                        ),
                      );
                    },
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 3,
                  child: MyContainer(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => BloodOxygenLevel(),
                        ),
                      );
                    },
                    text: 'Blood Oxygen Level',
                    imgPath: 'assets/images/spo2.png',
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 3,
                  child: MyContainer(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => RoomTemperature(),
                        ),
                      );
                    },
                    text: 'Room Temperature',
                    imgPath: 'assets/images/roomtemp.png',
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

class MyContainer extends StatefulWidget {
  const MyContainer({
    Key? key,
    this.text,
    this.imgPath,
    this.onTap,
  }) : super(key: key);
  final String? text;
  final String? imgPath;
  final VoidCallback? onTap;

  @override
  State<MyContainer> createState() => _MyContainerState();
}

class _MyContainerState extends State<MyContainer> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
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
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: Colors.blue[800],
              ),
            ),
            SizedBox(
              width: 0.0,
            ),
            Image(
              image: AssetImage(widget.imgPath.toString()),
              width: 50.0,
              height: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
