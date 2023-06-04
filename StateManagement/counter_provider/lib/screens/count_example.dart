import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/count_provider.dart';

class CountExample extends StatelessWidget {
  const CountExample({super.key});

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(
      context,
      //if the listen property is true, all widgets inside this class will be rebuilt.
      //Hence, it is set to false so only the Text widget is updated.
      listen: false,
    );
    debugPrint('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Provider'),
      ),
      body: Center(
        child: Consumer<CountProvider>(
          builder: (context, value, child) {
            debugPrint('build text');
            return Text(
              value.count.toString(),
              style: const TextStyle(fontSize: 50.0),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => countProvider.increment(),
        hoverColor: Colors.blueAccent,
        child: const Icon(Icons.add),
      ),
    );
  }
}
