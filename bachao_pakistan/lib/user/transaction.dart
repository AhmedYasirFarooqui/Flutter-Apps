// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, non_constant_identifier_names, must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'package:bachao_pakistan/custom-widgets/custom_text_field.dart';
import 'package:bachao_pakistan/user/user_dashboard.dart';

import '../custom-widgets/dashboard_buttons.dart';

class TransactionScreen extends StatefulWidget {
  TransactionScreen({super.key, this.approved});
  String? approved;

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  TextEditingController? transactionController = TextEditingController();
  File? image;
  // String? approved;
  Future PickImage() async {
    try {
      dynamic image =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      image ??= FlutterLogo();
      final imageTemporary = File(image!.path);
      setState(
        () {
          this.image = imageTemporary;
        },
      );
    } catch (e) {
      debugPrint('error: $e');
    }
  }

  showError(String errorMessage) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Error!',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            errorMessage,
            style: TextStyle(
              color: Color(0xFF207dff),
            ),
          ),
          actions: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Ok',
                  style: TextStyle(
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

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF207dff),
        automaticallyImplyLeading: false,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          'Activate Account',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Submit registration fee at following bank account to activate your account and then submit payment proof by clicking on Activate Account button',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Color(0xFF207dff),
                  // fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                '\t\t\t\t\t\t\t\t\tBank Name: ABC Bank.\nAccount no: 1232-123-123-123',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Color(0xFF207dff),
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            SizedBox(height: height / 40),
            Row(
              children: [
                SizedBox(width: width / 12),
                Text(
                  'Transaction ID',
                  style: TextStyle(
                    color: Color(0xFF207dff),
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
            SizedBox(height: height / 90),
            CustomTextField(
              controller: transactionController,
              borderColor: Color(0xFF207dff),
              keyBoardType: TextInputType.number,
              hintText: 'transaction ID...',
            ),
            SizedBox(height: height / 40),
            Row(
              children: [
                SizedBox(width: width / 12),
                Text(
                  'Transaction Image',
                  style: TextStyle(
                    color: Color(0xFF207dff),
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
            SizedBox(height: height / 90),
            image != null
                ? Container(
                    width: width / 1.3,
                    height: height / 3,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFF207dff),
                      ),
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: FileImage(image!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : Container(
                    width: width / 1.2,
                    height: height / 3,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFF207dff),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
            SizedBox(height: height / 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DashboardButtons(
                  text: 'Pick Image',
                  onTap: () {
                    setState(
                      () {
                        PickImage();
                      },
                    );
                  },
                ),
                // SizedBox(height: height / 40),
                DashboardButtons(
                  text: 'Activate Account',
                  onTap: () {
                    image == null
                        ?
                        // ? {
                        //     // widget.approved = 'active',
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (_) => DashboardScreen(
                        //           isapproved: widget.approved,
                        //         ),
                        //       ),
                        //     ),
                        //   }
                        showError('Image is required!')
                        : {
                            // approved = 'inactive',
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => DashboardScreen(
                                  isapproved: widget.approved,
                                ),
                              ),
                            )
                          };
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
