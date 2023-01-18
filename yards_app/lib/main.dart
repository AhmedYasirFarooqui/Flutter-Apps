// ignore_for_file: prefer_const_constructors, unnecessary_new, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unused_local_variable, use_function_type_syntax_for_parameters, non_constant_identifier_names

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yards_app/buyer/login.dart';
import 'package:yards_app/buyer/signup.dart';
import 'package:yards_app/buyer/user_screen.dart';
import 'package:yards_app/home.dart';
import 'package:yards_app/seller/seller_dashboard.dart';
import 'package:yards_app/social-sign-in/facebook_sign_in.dart';
import 'package:yards_app/social-sign-in/google_sign_in.dart';

// import 'firebase_options.dart';
import 'boats_information.dart';
import 'utils/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return RootRestorationScope(
      restorationId: 'root',
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => GoogleSignInProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => FacebookSignInProvider(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            fontFamily: 'Gilroy',
          ),
          home: SplashScreen(),
          routes: {
            'user': (context) => const UserScreen(),
            'login': (context) => const LoginScreen(),
            'signup': (context) => SignupScreen(),
            'home': (context) => HomeScreen(),
            'boats-info': (context) => BoatsInformation(),
            'seller dashboard': (context) => SellerDashboardScreen(),
          },
        ),
      ),
    );
    // return ChangeNotifierProvider(
    //   create: (context) => GoogleSignInProvider(),
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     title: 'Flutter Demo',
    //     theme: ThemeData(
    //       // fontFamily: 'Fira Code',
    //       primarySwatch: Colors.blue,
    //     ),
    //     home: SplashScreen(),
    //     routes: {
    //       'user': (context) => const UserScreen(),
    //       'login': (context) => const LoginScreen(),
    //       'signup': (context) => SignupScreen(),
    //     },
    //   ),
    // );
  }
}
