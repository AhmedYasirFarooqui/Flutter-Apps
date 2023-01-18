import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pos_app/user/login.dart';
import 'package:pos_app/user/signup.dart';
// import 'dashboard/courses.dart';
import 'dashboard/dashboard.dart';
// import 'dashboard/matric_courses.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tutota',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Gilroy',
        ),
        home: const SignUpPage(),
        initialRoute: '/',
        routes: {
          'login': (context) => const LoginPage(),
          'signup': (context) => const SignUpPage(),
          'dashboard': (context) => const DashboardPage(),
        });
  }
}