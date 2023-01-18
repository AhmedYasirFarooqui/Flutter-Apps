import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'HomePage.dart';

void main() async {
  final box = GetStorage();
  await GetStorage.init();
  //await box.erase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
