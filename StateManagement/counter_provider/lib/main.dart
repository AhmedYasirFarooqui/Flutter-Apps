import 'package:counter_provider/provider/count_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/auth_provider.dart';
import 'provider/favourite_provider.dart';
import 'provider/slider_provider.dart';
import 'provider/theme_provider.dart';
import 'screens/login.dart';
import 'screens/value_notifier_listener.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<ThemeChangerProvider>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => SliderProvider()),
        ChangeNotifierProvider(create: (_) => FavouriteItemProvider()),
        ChangeNotifierProvider(create: (_) => ThemeChangerProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: Builder(
        builder: (BuildContext context) {
          final provider = Provider.of<ThemeChangerProvider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            themeMode: provider.themeMode,
            darkTheme: ThemeData(
              brightness: Brightness.dark,
            ),
            theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: Colors.blue,
            ),
            home: LoginScreen(),
          );
        },
      ),
    );
  }
}
