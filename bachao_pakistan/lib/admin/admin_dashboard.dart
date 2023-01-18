// ignore_for_file: file_names, unused_local_variable, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:bachao_pakistan/admin/admin-options.dart/list_of_users.dart';
import 'package:bachao_pakistan/custom-widgets/custom_options.dart';
import 'package:bachao_pakistan/user/login.dart';

import '../profile.dart';
import 'admin-options.dart/create_ad.dart';
import 'admin-options.dart/list_of_ads.dart';
import 'admin-options.dart/payment_history.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    debugPrint(finalEmail);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF207dff),
        automaticallyImplyLeading: false,
        elevation: 0.0,
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 20),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(),
                  ),
                );
              },
              child: Icon(Icons.settings, size: 20.0),
            ),
          ),
        ],
        title: const Text(
          'Admin Dashboard',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: height / 50),
          Center(
            child: Text(
              'Welcome, Admin!',
              style: TextStyle(
                color: Color(0xFF207dff),
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),
            ),
          ),
          SizedBox(height: height / 30),
          CustomOptions(
            text: 'Payment History',
            width: 2.25,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PaymentHistoryScreen(),
                ),
              );
            },
          ),
          SizedBox(height: height / 30),
          CustomOptions(
            text: 'Create Ad',
            width: 1.75,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CreateAdScreen(),
                ),
              );
            },
          ),
          SizedBox(height: height / 30),
          CustomOptions(
            text: 'List Of Ads',
            width: 1.8,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AdsListScreen(),
                ),
              );
            },
          ),
          SizedBox(height: height / 30),
          CustomOptions(
            text: 'List Of Users',
            width: 1.93,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => UsersList(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
