// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:slm_21/dashboard/body_temperature.dart';
import 'package:slm_21/gauge.dart';
import 'package:slm_21/dashboard/health_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'dart:async';
import 'dart:convert';

import 'heart_rate.dart';

class BloodOxygenLevel extends StatefulWidget {
  const BloodOxygenLevel({Key? key}) : super(key: key);

  @override
  State<BloodOxygenLevel> createState() => _BloodOxygenLevelState();
}

class _BloodOxygenLevelState extends State<BloodOxygenLevel> {
  late List<LiveData> chartdata = [];
  late ChartSeriesController _chartSeriesController;

  List<LiveData> getChartData() {
    return [
      LiveData(0, 30),
      LiveData(1, 25),
      LiveData(2, 31),
      LiveData(3, 29),
      LiveData(4, 26),
      LiveData(5, 32),
    ];
  }

  int time = 10;
  updateDataSource(Timer timer) {
    chartdata.add(
      LiveData(
        time++,
        newSpO2!,
      ),
    );
    chartdata.removeAt(0);
    _chartSeriesController.updateDataSource(
      addedDataIndex: chartdata.length - 1,
      removedDataIndex: 0,
    );
  }

  @override
  void initState() {
    super.initState();
    chartdata = getChartData();
    Timer.periodic(const Duration(seconds: 1), updateDataSource);
    _activateListeners();
  }

  _activateListeners() {
    database.child('SLM').onValue.listen((event) {
      final data = event.snapshot.value;
      final temp = jsonEncode(data);
      final fromJson = slmFromJson(temp.toString());

      setState(() {
        // _displayText = temp;
        heartRate = fromJson.heartRate.toString();
        temperature = fromJson.temperature.toString();
        roomTemp = fromJson.roomTemperature.toString();
        spo2 = fromJson.sp02.toString();
        newHeartRate = double.parse(heartRate);
        newTemperature = double.parse(temperature);
        newRoomTemp = double.parse(roomTemp);
        newSpO2 = double.parse(spo2);
        // print(fromJson.heartRate);
        // debugPrint(data.toString());
      });
    });
  }

  @override
  void deactivate() {
    SubscriptionStream?.cancel();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10.0,
              ),
              Text(
                'Blood Oxygen Level',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue[800],
                ),
              ),
              RadialGauge(
                min: 10,
                max: 100,
                interval: 10,
                title: '',
                value: newSpO2!,
                text: '$spo2%',
              ),
              Text(
                'Live Data',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue[800],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                child: SfCartesianChart(
                  enableAxisAnimation: true,
                  series: [
                    LineSeries<LiveData, int>(
                      color: newSpO2! <= 95 || newSpO2! >= 100
                          ? Colors.red
                          : Colors.blue,
                      onRendererCreated: (ChartSeriesController controller) {
                        _chartSeriesController = controller;
                      },
                      dataSource: chartdata,
                      // legendItemText: 'Heart Rate',
                      xValueMapper: (LiveData data, _) => data.time,
                      yValueMapper: (LiveData data, _) => data.value,
                    )
                  ],
                  primaryXAxis: NumericAxis(
                    majorGridLines: MajorGridLines(width: 1),
                    edgeLabelPlacement: EdgeLabelPlacement.shift,
                    // interval: 2,
                    title: AxisTitle(text: 'Time(seconds)'),
                  ),
                  primaryYAxis: NumericAxis(
                    majorGridLines: MajorGridLines(width: 1),
                    edgeLabelPlacement: EdgeLabelPlacement.shift,
                    // interval: 2,
                    title: AxisTitle(text: 'SpO2(%)'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
