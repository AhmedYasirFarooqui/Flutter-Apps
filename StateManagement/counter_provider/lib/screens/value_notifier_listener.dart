// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:flutter/material.dart';

class NotifyListenerSreen extends StatelessWidget {
  NotifyListenerSreen({super.key});

  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  final ValueNotifier<bool> _toggle = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    log('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Value Notifier Counter Example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ValueListenableBuilder(
              valueListenable: _toggle,
              builder: (context, value, child) {
                return TextFormField(
                  obscureText: _toggle.value,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    suffix: InkWell(
                      onTap: () {
                        _toggle.value = !_toggle.value;
                      },
                      child: Icon(
                        _toggle.value == true
                            ? Icons.visibility_off_outlined
                            : Icons.visibility,
                      ),
                    ),
                  ),
                );
              }),
          Center(
            child: ValueListenableBuilder(
              valueListenable: _counter,
              builder: ((context, value, child) {
                return Text(
                  '${_counter.value}',
                  style: const TextStyle(fontSize: 50.0),
                );
              }),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
          // log(_counter.value.toString());
        },
        child: const Icon(
          Icons.add,
          size: 30.0,
        ),
      ),
    );
  }
}
