// ignore_for_file: avoid_print, unused_element, unused_import, prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:slm_21/dashboard/vaccination/vaccinated_animals.dart';
import 'package:slm_21/home_screen.dart';
import 'package:slm_21/notifcation_service/notifcation_service.dart';
import 'package:slm_21/settings.dart';
import 'package:slm_21/splash_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:slm_21/terms_and_conditions.dart';
import 'package:slm_21/user/forgot_password.dart';
import 'package:slm_21/user/login.dart';
import 'package:slm_21/user/signup.dart';
import 'package:slm_21/utils/user_shared_preferences.dart';

import 'dashboard.dart';
import 'dashboard/health_status.dart';
import 'dashboard/total_animals.dart';
import 'dashboard/vaccination/vaccine.dart';
import 'dashboard/vaccination/vaccine_information.dart';
import 'intro.dart';

// import 'intro.dart';
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  LocalNotificationService.initialize();
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: true,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission: ${settings.authorizationStatus}');
  } else {
    print('permission denied.');
  }
  FirebaseMessaging.instance.getInitialMessage().then(
    (message) {
      print('message: $message');
      if (message != null) {
        LocalNotificationService.createAndDisplayChatNotification(message);
      }
    },
  );

  FirebaseMessaging.onMessage.listen(
    (RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');

        LocalNotificationService.createAndDisplayChatNotification(message);
      }
    },
  );

  FirebaseMessaging.onMessageOpenedApp.listen(
    (message) {
      print(message.notification);
      if (message.notification != null) {
        LocalNotificationService.createAndDisplayChatNotification(message);
      }
    },
  );

  await UserSharedPreferences.init();

  runApp(const MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: AdaptiveTheme(
        light: ThemeData(
          brightness: Brightness.light,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: blue800Swatch,
          ),
          fontFamily: 'Simplified Arabic',
        ),
        dark: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: whiteSwatch,
          fontFamily: 'Simplified Arabic',
        ),
        initial: AdaptiveThemeMode.light,
        builder: (theme, darkTheme) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: theme,
          darkTheme: darkTheme,
          home: const SplashScreen(),
          routes: {
            'health status': (context) => HealthStatus(),
            'settings': (context) => SettingsPage(),
            'terms and conditions': (context) => TermsAndConditionsPage(),
            'dashboard': (context) => DashboardPage(),
            'intro page': (context) => IntroPage(),
            'home screen': (context) => HomePage(),
            'login': (context) => LoginPage(),
            'signup': (context) => SignUpPage(),
            'vaccination': (context) => VaccinePage(),
            'animals vaccinated': (context) => AnimalsVaccinated(),
            'total animals': (context) => TotalAnimals(),
            'forgot password': (context) => ForGotPassword(),
            'vaccine information': (context) => VaccineInformation(),
          },
        ),
      ),
    );
  }
}

final Map<int, Color> _blue800Map = {
  50: Color.fromARGB(255, 255, 255, 255),
  100: Color.fromRGBO(187, 222, 251, 1),
  200: Color.fromARGB(255, 144, 202, 249),
  300: Color.fromRGBO(100, 181, 246, 1),
  400: Color.fromRGBO(66, 165, 245, 1),
  500: Color.fromRGBO(33, 150, 243, 1),
  600: Color.fromRGBO(30, 136, 229, 1),
  700: Color.fromRGBO(25, 118, 210, 1),
  800: Color.fromRGBO(21, 101, 192, 1),
  900: Color.fromRGBO(13, 71, 161, 1),
};

final MaterialColor whiteSwatch =
    MaterialColor(Colors.blue[50]!.value, _blue800Map);

final MaterialColor blue800Swatch =
    MaterialColor(Colors.blue[800]!.value, _blue800Map);
