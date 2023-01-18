// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, sized_box_for_whitespace

// import 'dart:developer';

// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:slm_21/gauge.dart';
import 'package:slm_21/dashboard/health_data.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'heart_rate.dart';

// import '../splash_screen.dart';

String spo2 = '';
String heartRate = '';
String temperature = '';
String roomTemp = '';
double? newHeartRate = 0.0;
double? newTemperature = 0.0;
double? newRoomTemp = 0.0;
double? newSpO2 = 0.0;

sendNotification(
  String msg,
  String token,
  String name,
) async {
  var body = {
    "registration_ids": [token],
    "notification": {
      "body": msg,
      "title": name,
      "android_channel_id": "pushnotificationapp",
      "sound": true,
    },
    "data": {
      "action": "reciveMsg",
      'token': token,
    }
  };
  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'authorization':
        'AAAAx4nmvCM:APA91bFU9jLEeBczEZ50Xp2xIlB66ep1PZwuTsKDcMBmaYsGRodeUOeIy72p5AdCZRDGu6EJPssAmGj4feAUA1mRGrLWnWOJ1SHcWcIQbiWdRJ5hZAIBltq0zLuwGiLL47FpupIxtugn'
  };
  var response = await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: headers,
      body: jsonEncode(body));
  if (response.statusCode == 200) {
    debugPrint(response.body);
  }
}

final database = FirebaseDatabase.instance.ref();
StreamSubscription? SubscriptionStream;

class BodyTemperature extends StatefulWidget {
  const BodyTemperature({Key? key}) : super(key: key);

  @override
  State<BodyTemperature> createState() => _BodyTemperatureState();
}

class _BodyTemperatureState extends State<BodyTemperature> {
  late List<LiveData> chartdata = [];
  late ChartSeriesController _chartSeriesController;

  List<LiveData> getChartData() {
    return [
      LiveData(0, 99),
      LiveData(1, 98),
      LiveData(2, 97),
      LiveData(3, 98),
      LiveData(4, 99),
      LiveData(5, 99),
    ];
  }

  int time = 10;
  updateDataSource(Timer timer) {
    chartdata.add(
      LiveData(
        time++,
        newTemperature!,
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
                height: 10.0,
              ),
              Text(
                'Body Temperature',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue[800],
                ),
              ),
              RadialGauge(
                min: 50,
                max: 150,
                interval: 10,
                title: '',
                value: newTemperature!,
                text: '$temperature\u2109',
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
                      color: newTemperature! <= 98 || newTemperature! >= 100
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
                    title: AxisTitle(text: 'Body Temperature(fahrenheit)'),
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
