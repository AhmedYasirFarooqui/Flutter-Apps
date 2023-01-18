// ignore_for_file: constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

// import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class Vaccinated extends StatefulWidget {
  const Vaccinated({Key? key}) : super(key: key);

  @override
  State<Vaccinated> createState() => _VaccinatedState();
}

enum IsVaccinated {
  Yes,
  No,
}

class _VaccinatedState extends State<Vaccinated> {
  IsVaccinated? isVaccinated;
  String? selectedVaccine;
  String? vaccinationValue;
  String? selectedDate;
  DateTime date = DateTime.now();

  static Future<void> addDataToSf(
      String isSelected, String dateTime, String vaccinationName) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setStringList(
        'vacinated', <String>[isSelected, vaccinationName, dateTime]);
  }

  String dropdownValue = 'Anaplas Vaccine';
  List<String> Vaccines = [
    'Anaplas Vaccine',
    'Scour Vaccine',
    'Vibrio Bacterin',
    'Trich Vaccine',
  ];

  IsVaccinated? options = IsVaccinated.Yes;
  @override
  void initState() {
    selectedDate = '${date.day} - ${date.month} - ${date.year}';
    vaccinationValue = 'yes';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 80.0,
            ),
            Center(
              child: Text(
                'Animal 1',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue[800],
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Column(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 180.0),
                  child: Text(
                    'Vaccinated?',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue[800],
                    ),
                  ),
                ),
                SizedBox(
                  width: 30.0,
                ),
                ListTile(
                  title: const Text('Yes'),
                  leading: Radio<IsVaccinated>(
                    value: IsVaccinated.Yes,
                    groupValue: options,
                    onChanged: (IsVaccinated? value) {
                      setState(() {
                        options = value;
                        isVaccinated = options;
                        vaccinationValue = 'yes';
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('No'),
                  leading: Radio<IsVaccinated>(
                    value: IsVaccinated.No,
                    groupValue: options,
                    onChanged: (IsVaccinated? value) {
                      setState(() {
                        options = value;
                        isVaccinated = options;
                        vaccinationValue = 'No';
                      });
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Vaccines',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue[800],
                      ),
                    ),
                    IgnorePointer(
                      ignoring: isVaccinated == IsVaccinated.No ? true : false,
                      child: Container(
                        decoration: BoxDecoration(
                          color: isVaccinated == IsVaccinated.No
                              ? Colors.grey[200]
                              : Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButton(
                            underline: Container(
                              color: Colors.grey[200],
                            ),
                            value: dropdownValue,
                            icon: Icon(
                              Icons.arrow_drop_down_rounded,
                              color: Colors.blue[800],
                            ),
                            alignment: AlignmentDirectional.center,
                            elevation: 16,
                            style: TextStyle(
                              color: Colors.blue[800],
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                            ),
                            onChanged: (String? newValue) {
                              setState(
                                () {
                                  dropdownValue = newValue!;
                                  selectedVaccine = dropdownValue;
                                },
                              );
                            },
                            items: Vaccines.map((String selectedValue) {
                              return DropdownMenuItem<String>(
                                value: selectedValue,
                                child: Text(selectedValue),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Choose Date',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue[800],
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                IgnorePointer(
                  ignoring: isVaccinated == IsVaccinated.No ? true : false,
                  child: Container(
                    width: 95.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: isVaccinated == IsVaccinated.No
                          ? Colors.grey[200]
                          : Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: InkWell(
                          child: Text(
                            '${date.day} / ${date.month} / ${date.year}',
                            style: TextStyle(
                              color: Colors.blue[800],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () async {
                            DateTime? newDate = await showDatePicker(
                              context: context,
                              initialDate: date,
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100),
                            );

                            if (newDate == null) return;

                            setState(() {
                              date = newDate;
                              selectedDate =
                                  '${date.day} / ${date.month} / ${date.year}';
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue[800],
                  ),
                  onPressed: () async {
                    if (vaccinationValue == 'No') {
                      addDataToSf(vaccinationValue!, 'No Vaccine', 'No Date');
                    } else {
                      addDataToSf(
                          vaccinationValue!, selectedDate!, selectedVaccine!);
                    }
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: 45.0,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue[800],
                  ),
                  onPressed: () => Navigator.of(context)
                      .pushReplacementNamed('health status'),
                  child: const Text(
                    'View Stats',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
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
