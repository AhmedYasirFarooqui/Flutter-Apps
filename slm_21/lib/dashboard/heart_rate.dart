// ignore_for_file: unused_field, sized_box_for_whitespace, prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:slm_21/gauge.dart';
import 'package:slm_21/dashboard/health_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:convert';
import 'body_temperature.dart';

class HeartRate extends StatefulWidget {
  const HeartRate({Key? key}) : super(key: key);

  @override
  State<HeartRate> createState() => _HeartRateState();
}

class _HeartRateState extends State<HeartRate> {
  late List<LiveData> chartdata = [];
  late ChartSeriesController _chartSeriesController;

  List<LiveData> getChartData() {
    return [
      LiveData(0, 200),
      LiveData(1, 180),
      LiveData(2, 185),
      LiveData(3, 170),
      LiveData(4, 190),
      LiveData(5, 195),
    ];
  }

  int time = 10;
  updateDataSource(Timer timer) {
    chartdata.add(
      LiveData(
        time++,
        newHeartRate!,
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
    database.child('SLM').onValue.listen(
      (event) {
        final data = event.snapshot.value;
        final temp = jsonEncode(data);
        final fromJson = slmFromJson(temp.toString());

        setState(
          () {
            // _displayText = temp;
            heartRate = fromJson.heartRate.toString();
            temperature = fromJson.temperature.toString();
            roomTemp = fromJson.roomTemperature.toString();
            spo2 = fromJson.sp02.toString();
            newHeartRate = double.parse(heartRate);
            newTemperature = double.parse(temperature);
            newRoomTemp = double.parse(roomTemp);
            newSpO2 = double.parse(spo2);
          },
        );
      },
    );
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
                height: 5.0,
              ),
              Text(
                'Heart Rate',
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
                value: newHeartRate!,
                text: '$heartRate bps',
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
                      color: newHeartRate! <= 40 || newHeartRate! >= 80
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
                    title: AxisTitle(text: 'HeartRate(bps)'),
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

class LiveData {
  int time = 0;
  double value = 0;

  LiveData(this.time, this.value);
}
