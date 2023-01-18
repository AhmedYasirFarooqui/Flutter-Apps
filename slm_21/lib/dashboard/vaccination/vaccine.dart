// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../dashboard.dart';

class VaccinePage extends StatefulWidget {
  const VaccinePage({Key? key}) : super(key: key);
  @override
  _VaccinePageState createState() => _VaccinePageState();
}

class _VaccinePageState extends State<VaccinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0,
        backgroundColor: Colors.blue[800],
        title: Text(
          'Vaccination',
          style: TextStyle(
              fontSize: 30.0, fontWeight: FontWeight.w600, color: Colors.white
              // color: Colors.blue[800],
              ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              DashboardOptions(
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed('animals vaccinated');
                },
                text: 'Animals Vaccinated',
                imgPath: 'assets/images/cow.png',
              ),
              DashboardOptions(
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed('vaccine information');
                },
                text: 'Vaccine Information',
                imgPath: 'assets/images/vaccinated-icon.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
