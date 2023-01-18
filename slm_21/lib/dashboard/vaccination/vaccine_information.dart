// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class VaccineInformation extends StatefulWidget {
  const VaccineInformation({Key? key}) : super(key: key);

  @override
  State<VaccineInformation> createState() => _VaccineInformationState();
}

class _VaccineInformationState extends State<VaccineInformation> {
  Future<dynamic> displayInfo(
    String title,
    String description,
    String price,
  ) {
    return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (ctx) => Container(
        child: AlertDialog(
          title: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w600,
                color: Colors.blue[800],
              ),
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 140.0),
                      child: Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[800],
                        ),
                      ),
                    ),
                    Text(
                      description,
                      softWrap: true,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 190.0),
                      child: Text(
                        'Price',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[800],
                        ),
                      ),
                    ),
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400,
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0,
        backgroundColor: Colors.blue[800],
        title: Text(
          'Vaccine Information',
          style: TextStyle(
              fontSize: 30.0, fontWeight: FontWeight.w600, color: Colors.white
              // color: Colors.blue[800],
              ),
        ),
      ),
      body: Column(
        children: [
          // const SizedBox(
          //   height: 80.0,
          // ),
          // Center(
          //   child: Text(
          //     'Vaccine Information',
          //     style: TextStyle(
          //       fontSize: 32.0,
          //       fontWeight: FontWeight.w600,
          //       color: Colors.blue[800],
          //     ),
          //   ),
          // ),
          SizedBox(height: 50.0),
          Center(
            child: Vaccines(
                onTap: () async => displayInfo(
                      'Anaplas Vaccine',
                      '\u2022 Anaplasmosis is an infectious parasitic disease in cattle, spread primarily by ticks and blood-sucking insects like mosquitoes. The killed anaplasmosis vaccine protects cows and bulls of any age from infection and requires a booster given 4 to 6 weeks after the initial vaccination.Available in 10 or 50 dose bottles ',
                      '10 dose bottles: \$8.50 per dose | 50 dose bottles: \$7.50 per dose |*10 dose (\$85) minimum and \$10 flat rate shipping',
                    ),
                text: 'Anaplas Vaccine'),
          ),
          SizedBox(height: 50.0),
          Center(
            child: Vaccines(
                onTap: () async => displayInfo(
                      'Trich Vaccine',
                      'TrichGuard® is the first and only vaccine licensed to reduce shedding of Tritrichomonas foetus organisms, and thus helps protect against the spread of trichomoniasis in cattle, a venereal disease spread by bulls that can lead to lost pregnancies and open cows. By making TRICHGUARD a part of your vaccination regimen, you are reducing the impact of Tritrichomonas foetus. Available in 50 dose bottle.',
                      '\$208 per bottle.',
                    ),
                text: 'Trich Vaccine'),
          ),
          SizedBox(height: 50.0),
          Center(
            child: Vaccines(
                onTap: () async => displayInfo(
                      'Vibrio Bacterin',
                      'ScourGuard® 4KC has been demonstrated to be effective against diarrhea in calves caused by bovine rotavirus (serotypes G6 and G10), bovine coronavirus, Escherichia coli (E. coli) and Clostridium perfringens Type C when calves nurse vaccinated dams. Available in 10-doese and 50-dose vials.',
                      '\$58.28 per 10 dose | \$259.71 per 50 dose',
                    ),
                text: 'Vibrio Bacterin'),
          ),
          SizedBox(height: 50.0),
          Center(
            child: Vaccines(
                onTap: () async => displayInfo(
                      'Scour Vaccine',
                      'VIBRIN® is for vaccination of healthy cows and heifers as an aid in preventing campylobacteriosis (vibriosis) caused by Campylobacter fetus. Available in 50-dose vials.',
                      '\$33.99 per 50 dose ',
                    ),
                text: 'Scour Vaccine'),
          ),
        ],
      ),
    );
  }
}

class Vaccines extends StatefulWidget {
  const Vaccines({Key? key, this.onTap, this.text}) : super(key: key);
  final String? text;
  final VoidCallback? onTap;

  @override
  State<Vaccines> createState() => _VaccinesState();
}

class _VaccinesState extends State<Vaccines> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: MediaQuery.of(context).size.width / 1.09,
        height: MediaQuery.of(context).size.height / 8,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 3.0,
          child: Center(
            child: Text(
              widget.text.toString(),
              style: TextStyle(
                fontSize: 25.0,
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
