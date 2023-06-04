// ignore_for_file: library_private_types_in_public_api

import 'package:counter_provider/provider/slider_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SliderScreen extends StatelessWidget {
  SliderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<SliderProvider>(
              builder: (context, value, child) {
                return Slider(
                  min: 0,
                  max: 1,
                  value: value.value,
                  onChanged: (val) {
                    value.setValue(val);
                  },
                );
              },
            ),
            Consumer<SliderProvider>(
              builder: (context, value, child) {
                return Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(value.value),
                        ),
                        height: 100.0,
                        child: const Text('Container 1'),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(value.value),
                        ),
                        height: 100.0,
                        child: const Text('Container 2'),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
