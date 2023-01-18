// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, constant_identifier_names, non_constant_identifier_names, unused_local_variable
// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slm_21/dashboard/vaccination/vaccination.dart';

class AnimalsVaccinated extends StatefulWidget {
  const AnimalsVaccinated({Key? key}) : super(key: key);
  @override
  AnimalsVaccinatedState createState() => AnimalsVaccinatedState();
}

class AnimalsVaccinatedState extends State<AnimalsVaccinated> {
  List<String>? vacineList;
  @override
  void initState() {
    getDataToSF();
    super.initState();
  }

  getDataToSF() async {
    final pref = await SharedPreferences.getInstance();
    List<String>? items = pref.getStringList('vacinated');
    // log('${items!.toString()}');
    setState(() {
      vacineList = items;
    });
  }

  Future<dynamic> displayInfo() {
    return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (ctx) => AlertDialog(
        title: Center(
          child: Text(
            'Vaccination',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w600,
              color: Colors.blue[800],
            ),
          ),
        ),
        content: SingleChildScrollView(
          child: vacineList == null
              ? Center(
                  child: Text('No Data'),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Vaccinated: ',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          vacineList![0],
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.blue[800],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Date: ',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          vacineList![1],
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.blue[800],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Vaccine: ',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          vacineList![2],
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.blue[800],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blue[800],
            ),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Vaccinated(),
              ),
            ),
            child: const Text(
              'Update',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blue[800],
            ),
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(
              'Ok',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80.0,
          backgroundColor: Colors.blue[800],
          title: Text(
            'Animals Vaccinated',
            style: TextStyle(
                fontSize: 30.0, fontWeight: FontWeight.w600, color: Colors.white
                // color: Colors.blue[800],
                ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 30.0,
            ),
            Animals(onTap: () async => displayInfo(), text: 'Animal 1'),
          ],
        ),
      ),
    );
  }
}

class Animals extends StatefulWidget {
  const Animals({Key? key, this.onTap, this.text}) : super(key: key);
  final String? text;
  final VoidCallback? onTap;

  @override
  State<Animals> createState() => _AnimalsState();
}

class _AnimalsState extends State<Animals> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: MediaQuery.of(context).size.width / 1.09,
        height: MediaQuery.of(context).size.height / 10,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 3.0,
          child: Center(
            child: Text(
              widget.text.toString(),
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                color: Colors.blue[800],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
