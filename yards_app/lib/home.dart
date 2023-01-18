// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
// import 'package:yards_app/custom_widgets/custom_search_bar.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:yards_app/bottom-tab-bar-screens/accounts_screen.dart';
import 'package:yards_app/bottom-tab-bar-screens/items.dart';
import 'package:yards_app/bottom-tab-bar-screens/inbox.dart';
import 'bottom-tab-bar-screens/main_screen.dart';
// import 'custom_widgets/custom_options.dart';
// import 'package:provider/provider.dart';
// import 'package:yards_app/social-sign-in/facebook_sign_in.dart';
// import 'package:yards_app/social-sign-in/google_sign_in.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> screens() {
    return [
      MainScreen(),
      InboxScreen(),
      ItemsScreen(),
      AccountsScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> navbarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: 'Home',
        // textStyle: TextStyle(color: Colors.white),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.grey[100],
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.message),
        title: 'Inbox',
        // textStyle: TextStyle(color: Colors.white),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.grey[100],
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.shopping_cart),
        title: 'Items',
        // textStyle: TextStyle(color: Colors.white),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.grey[100],
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: 'Account',
        // textStyle: TextStyle(color: Colors.white),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.grey[100],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        resizeToAvoidBottomInset: true,
        navBarStyle: NavBarStyle.style3,
        backgroundColor: Color(0xFF163257),
        context,
        screens: screens(),
        items: navbarItems(),
      ),
    );
  }
}
