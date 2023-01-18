// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatefulWidget {
  const TermsAndConditionsPage({Key? key}) : super(key: key);

  @override
  _TermsAndConditionsPageState createState() => _TermsAndConditionsPageState();
}

class _TermsAndConditionsPageState extends State<TermsAndConditionsPage> {
  // By defaut, the checkbox is unchecked and "agree" is "false"
  bool agree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 70.0,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 108.0),
            child: Text(
              'Terms And Conditions',
              style: TextStyle(
                color: Colors.blue[800],
                fontFamily: 'Simplified Arabic',
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: [
              Material(
                child: Checkbox(
                  value: agree,
                  onChanged: (value) {
                    setState(
                      () {
                        agree = value ?? false;
                      },
                    );
                  },
                ),
              ),
              Text(
                'I have read and accept terms and conditions.',
              )
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blue[800],
            ),
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }
}
