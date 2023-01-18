// ignore_for_file: unused_local_variable, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bachao_pakistan/custom-widgets/custom_text_field.dart';
import 'package:bachao_pakistan/user/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'custom-widgets/custom_options.dart';
import 'custom-widgets/dashboard_buttons.dart';
import 'custom-widgets/number_formatter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
    // this.username,
    // this.password,
    // this.contactNumber,
    // this.city,
    // this.address,
  });

  // final String? username;
  // final String? password;
  // final String? contactNumber;
  // final String? city;
  // final String? address;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // TextEditingController nameController = TextEditingController();
  // TextEditingController name2Controller = TextEditingController();
  // TextEditingController emailController = TextEditingController();
  // TextEditingController email2Controller = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
  // TextEditingController password2Controller = TextEditingController();
  // TextEditingController cnicController = TextEditingController();
  // TextEditingController mobileController = TextEditingController();
  final mobileFormatter = NumberTextFormatter();
  // void logout() async {
  //   final SharedPreferences sharedPreferences =
  //       await SharedPreferences.getInstance();
  //   sharedPreferences.remove('token');
  //   debugPrint(sharedPreferences.getString('email'));
  //   // sharedPreferences.remove('password');
  // }

  logout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    finalEmail = pref.getString('email');
    debugPrint(finalEmail);
    pref.remove('email');
    finalEmail = pref.getString('email');
    debugPrint(finalEmail);
  }

  @override
  Widget build(BuildContext context) {
    // debugPrint(widget.username);
    // debugPrint(widget.password);
    // debugPrint(widget.contactNumber);
    // debugPrint(widget.city);
    // debugPrint(widget.address);
    // nameController.text = widget.username!;
    // passwordController.text = widget.password!;
    // mobileController.text = widget.contactNumber!;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    updateInfo(String title, Widget content) {
      return showDialog(
        context: context,
        builder: (dialogContex) {
          return AlertDialog(
            title: Center(
              child: Text(title),
            ),
            content: content,
            actions: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  debugPrint('Updated');
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Update',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF207dff),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF207dff),
        // automaticallyImplyLeading: false,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // SizedBox(height: height / 40),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     Text(
              //       'Ahmed Yasir',
              //       style: TextStyle(
              //         color: Color(0xFF207dff),
              //         fontWeight: FontWeight.bold,
              //         fontSize: 25.0,
              //         decoration: TextDecoration.none,
              //       ),
              //     ),
              //     SizedBox(width: width / 3),
              //     InkWell(
              //       onTap: () => updateInfo(
              //         'Update Username',
              //         CustomTextField(
              //           hintText: 'Enter New Username...',
              //           borderColor: Color(0xFF207dff),
              //         ),
              //       ),
              //       child: Icon(
              //         Icons.edit,
              //         size: 22.0,
              //         color: Color(0xFF207dff),
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(height: height / 30),
              CustomOptions(
                text: 'Update Password',
                width: 2.27,
                onTap: () => updateInfo(
                  'Update Password',
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // SizedBox(height: height / 40),
                      CustomTextField(
                        hintText: 'Enter Old Password...',
                        borderColor: Color(0xFF207dff),
                      ),
                      SizedBox(height: height / 40),
                      CustomTextField(
                        hintText: 'Enter New Password...',
                        borderColor: Color(0xFF207dff),
                      ),
                      SizedBox(height: height / 40),
                      CustomTextField(
                        hintText: 'Retype New Password...',
                        borderColor: Color(0xFF207dff),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height / 40),
              CustomOptions(
                text: 'Contact Number',
                width: 2.19,
                onTap: () {
                  updateInfo(
                    'Update Contact Number',
                    CustomTextField(
                      // icon: Icons.phone,
                      hintText: 'Enter new contact number...',
                      borderColor: Color(0xFF207dff),
                      keyBoardType: TextInputType.phone,
                      inputForamatter: [
                        FilteringTextInputFormatter.digitsOnly,
                        mobileFormatter,
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: height / 40),
              CustomOptions(
                text: 'City',
                width: 1.42,
                onTap: () {
                  updateInfo(
                    'Update City',
                    CustomTextField(
                      hintText: 'Enter new city...',
                      borderColor: Color(0xFF207dff),
                    ),
                  );
                },
              ),
              // SizedBox(height: height / 40),
              // CustomOptions(
              //   text: 'Account Number',
              //   width: 2.2,
              //   onTap: () {},
              // ),
              SizedBox(height: height / 40),
              CustomOptions(
                text: 'Address',
                width: 1.6,
                onTap: () {
                  updateInfo(
                    'Update Address',
                    CustomTextField(
                      hintText: 'Enter new address...',
                      borderColor: Color(0xFF207dff),
                    ),
                  );
                },
              ),
              SizedBox(height: height / 6),
              DashboardButtons(
                text: 'Sign Out',
                onTap: () {
                  logout();
                  Navigator.of(context)
                    ..pop()
                    ..pop()
                    ..pop()
                    ..pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
