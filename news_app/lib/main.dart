import 'package:flutter/material.dart';
import 'package:news_app/splash_screen.dart';
import 'package:news_app/user/login.dart';
import 'package:news_app/user/signup.dart';
import 'package:news_app/utils/colors.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.,
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'ZillaSlab',
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppColors.red,
        ),
      ),
      routes: {
        '/user/signup.dart': (context) => const SignUpScreen(),
        '/user/login.dart': (context) => const LogInScreen(),
        '/lib/home.dart': (context) => const HomeScreen(),
      },
      home: const splashScreen(),
    );
  }
}
