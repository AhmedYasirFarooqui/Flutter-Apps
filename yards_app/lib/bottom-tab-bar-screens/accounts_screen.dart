// ignore_for_file: unused_local_variable, prefer_const_constructors, non_constant_identifier_names, unused_catch_clause, empty_catches, unused_element

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
// import 'package:yards_app/home.dart';
// import '../buyer/user_screen.dart';
import '../social-sign-in/google_sign_in.dart';

class AccountsScreen extends StatefulWidget {
  const AccountsScreen({super.key});

  @override
  State<AccountsScreen> createState() => _AccountsScreenState();
}

class _AccountsScreenState extends State<AccountsScreen> {
  File? image;
  Future PickImage() async {
    try {
      dynamic image =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      image ??= FlutterLogo();
      final imageTemporary = File(image!.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      debugPrint('error: ${e.message}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GoogleSignInProvider>(
      context,
      listen: false,
    );

    Future ShowDialog(String title, String text) async {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              title,
              style: TextStyle(
                color: Color(0xFF163257),
              ),
            ),
            // insetPadding: EdgeInsets.all(15.0),
            content: SingleChildScrollView(
              child: Text(text),
            ),
            actions: [
              TextButton(
                child: Text(
                  'Ok',
                  style: TextStyle(
                    color: Color(0xFF163257),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70.0,
        centerTitle: true,
        backgroundColor: const Color(0xFF163257),
        title: const Text(
          'Account and Settings',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: height / 75),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                provider.googleSignIn.currentUser != null
                    ? CircleAvatar(
                        radius: 50.0,
                        backgroundImage: NetworkImage(
                          provider.user.photoUrl.toString(),
                        ),
                      )
                    : image != null
                        ? InkWell(
                            onTap: () => PickImage(),
                            child: CircleAvatar(
                              radius: 50.0,
                              backgroundImage: FileImage(image!),
                            ),
                          )
                        // Image.file(image!, width: 60.0, height: 60.0)
                        : InkWell(
                            onTap: () => PickImage(),
                            child: CircleAvatar(
                              backgroundColor: Colors.grey[300],
                              radius: 50.0,
                              child: Icon(
                                Icons.add_a_photo,
                                color: Color(0xFF163257),
                                size: 30.0,
                              ),
                            ),
                          ),
                SizedBox(
                  width: width / 1.5,
                  child: ListTile(
                    title: Text(
                      provider.googleSignIn.currentUser != null
                          ? 'Hi, ${provider.user.displayName.toString()}.'
                          : 'Hi, there!',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20.0,
                        color: Color(0xFF163257),
                      ),
                    ),
                    // subtitle: Text(
                    //   provider.googleSignIn.currentUser != null
                    //       ? provider.user.email.toString()
                    //       : 'No Email',
                    // ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height / 25,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 250.0),
              child: Text(
                'Settings',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF163257),
                ),
              ),
            ),
            SizedBox(
              height: height / 25,
            ),
            Row(
              children: [
                SizedBox(
                  width: width / 18,
                ),
                Icon(
                  Icons.phone,
                  color: Color(0xFF163257),
                ),
                SizedBox(
                  width: width / 18,
                ),
                InkWell(
                  onTap: () => ShowDialog('Phone Number', '03042490209'),
                  child: Text(
                    'Phone Number',
                    style: TextStyle(
                      // fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                      color: Color(0xFF163257),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height / 35,
            ),
            Row(
              children: [
                SizedBox(
                  width: width / 18,
                ),
                Icon(
                  Icons.email,
                  color: Color(0xFF163257),
                ),
                SizedBox(
                  width: width / 18,
                ),
                InkWell(
                  onTap: () => ShowDialog(
                    'Email',
                    provider.googleSignIn.currentUser != null
                        ? provider.user.email
                        : 'No Email',
                  ),
                  child: Text(
                    'Email',
                    style: TextStyle(
                      // fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                      color: Color(0xFF163257),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height / 35,
            ),
            Row(
              children: [
                SizedBox(
                  width: width / 17,
                ),
                Icon(
                  FontAwesomeIcons.rightFromBracket,
                  color: Color(0xFF163257),
                ),
                SizedBox(
                  width: width / 18,
                ),
                InkWell(
                  onTap: () {
                    provider.googleSignIn.currentUser != null
                        ? {
                            provider.signOut(),
                            Navigator.of(context, rootNavigator: true)
                                .pushReplacementNamed('user'),
                            debugPrint('signed out')
                          }
                        : Navigator.of(context, rootNavigator: true)
                            .pushReplacementNamed('user');
                  },
                  child: const Text(
                    'Sign Out',
                    style: TextStyle(
                      color: Color(0xFF163257),
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height / 75,
            ),
          ],
        ),
      ),
    );
  }
}
