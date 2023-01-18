// ignore_for_file: unused_local_variable, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:yards_app/seller/tab-bar-screens/accounts_screen.dart';
import 'package:yards_app/seller/tab-bar-screens/inbox.dart';
// import 'package:yards_app/bottom-tab-bar-screens/accounts_screen.dart';
import 'package:yards_app/seller/tab-bar-screens/listings.dart';
import 'package:yards_app/seller/tab-bar-screens/sales.dart';

class SellerDashboardScreen extends StatefulWidget {
  const SellerDashboardScreen({super.key});

  @override
  State<SellerDashboardScreen> createState() => _SellerDashboardScreenState();
}

class _SellerDashboardScreenState extends State<SellerDashboardScreen>
    with SingleTickerProviderStateMixin {
  List tabs = [
    'Listings',
    'Sales',
    'Inbox',
    'Account',
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 70.0,
          backgroundColor: const Color(0xFF163257),
          title: const Text(
            'Seller Dashboard',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          elevation: 0.0,
          actions: [
            TextButton(
              child: const Text(
                'Buy',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              onPressed: () {},
            ),
          ],
          bottom: TabBar(
            indicatorColor: Colors.white,
            controller: _tabController,
            tabs: [
              Tab(
                text: tabs[0],
              ),
              Tab(
                text: tabs[1],
              ),
              FittedBox(
                child: Tab(
                  text: tabs[2],
                ),
              ),
              Tab(
                text: tabs[3],
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            ListingsScreen(),
            SalesScreen(),
            InboxScreen(),
            AccountsScreen(),
          ],
        ),
      ),
    );
  }
}
