// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class RadialGauge extends StatefulWidget {
  const RadialGauge({
    Key? key,
    this.title,
    required this.value,
    this.text,
    required this.min,
    required this.max,
    this.interval,
  }) : super(key: key);
  final String? title;
  final double value;
  final String? text;
  final double min;
  final double max;
  final double? interval;

  @override
  State<RadialGauge> createState() => _RadialGaugeState();
}

class _RadialGaugeState extends State<RadialGauge> {
  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      enableLoadingAnimation: true,
      animationDuration: 2000,
      title: GaugeTitle(
        text: widget.title.toString(),
        textStyle: TextStyle(
          fontSize: 18.0,
          color: Colors.blue[800],
        ),
      ),
      axes: [
        RadialAxis(
          minimum: widget.min,
          maximum: widget.max,
          interval: widget.interval,
          pointers: [
            RangePointer(
              gradient: SweepGradient(
                colors: [
                  Color(0xFF03018C),
                  Color(0xFF212AA5),
                  Color(0xFF4259C3),
                  Color(0xFF7B9FF2),
                  Color(0xFF9EC2FF),
                ],
                stops: <double>[0, 0.25, 0.5, 0.75, 1],
              ),
              enableAnimation: true,
              animationDuration: 1000,
              value: widget.value,
            ),
            NeedlePointer(
              value: widget.value,
              needleColor: Colors.black,
              enableAnimation: true,
            ),
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
                widget: Text(
                  widget.text.toString(),
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                angle: 90,
                positionFactor: 0.5)
          ],
        ),
      ],
    );
  }
}
