// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:slm_21/dashboard/vaccination/vaccinated_animals.dart';

import 'health_status.dart';

class TotalAnimals extends StatefulWidget {
  const TotalAnimals({Key? key}) : super(key: key);

  @override
  State<TotalAnimals> createState() => _TotalAnimalsState();
}

class _TotalAnimalsState extends State<TotalAnimals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0,
        backgroundColor: Colors.blue[800],
        title: const Text(
          'Total Animals',
          style: TextStyle(
              fontSize: 30.0, fontWeight: FontWeight.w600, color: Colors.white
              // color: Colors.blue[800],
              ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            Center(
              child: Animals(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const HealthStatus(),
                  ),
                ),
                text: 'Animal 1',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
