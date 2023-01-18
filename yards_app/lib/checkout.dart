import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({
    super.key,
    this.duration,
    this.groupSize,
    this.overnight,
    this.dateFrom,
    this.dateTo,
    this.timeFrom,
    this.timeTo,
  });
  final String? duration;
  final String? groupSize;
  final String? overnight;
  final String? dateFrom;
  final String? dateTo;
  final String? timeFrom;
  final String? timeTo;

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
