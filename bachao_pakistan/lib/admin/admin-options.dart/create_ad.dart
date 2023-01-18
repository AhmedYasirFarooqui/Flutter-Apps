// ignore_for_file: unused_local_variable, prefer_const_constructors, non_constant_identifier_names
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
import 'dart:async';

// import 'package:flutter/services.dart' show rootBundle;
// import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../custom-widgets/custom_text_field.dart';
import '../../custom-widgets/dashboard_buttons.dart';
// import 'list_of_ads.dart';

class CreateAdScreen extends StatefulWidget {
  const CreateAdScreen({super.key});

  @override
  State<CreateAdScreen> createState() => _CreateAdScreenState();
}

class _CreateAdScreenState extends State<CreateAdScreen> {
  dynamic path = TextEditingController();
  File? image;
  Future PickImage() async {
    try {
      dynamic image =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      image ??= FlutterLogo();
      final imageTemporary = File(image!.path);
      // getImageFileFromAssets(path);
      // saveImage(image!.path);
      setState(
        () {
          this.image = imageTemporary;
        },
      );
      debugPrint(image!.path);
    } catch (e) {
      debugPrint('error: $e');
    }
  }

  // Future<File> getImageFileFromAssets(String path) async {
  //   final byteData = await rootBundle.load('assets/$path');

  //   final file = File('${(await getTemporaryDirectory()).path}/$path');
  //   await file.writeAsBytes(byteData.buffer
  //       .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

  //   return file;
  // }

  void saveImage(path) async {
    SharedPreferences saveimage = await SharedPreferences.getInstance();
    saveimage.setString("imagepath", path);
  }

  showError(String title, errorMessage) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            title,
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
          'Create Ad',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: height / 40),
          Row(
            children: [
              SizedBox(width: width / 12),
              Text(
                'Enter Website Link',
                style: TextStyle(
                  color: Color(0xFF207dff),
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          ),
          SizedBox(height: height / 50),
          CustomTextField(
            controller: path,
            borderColor: Color(0xFF207dff),
            hintText: 'Website Link...',
          ),
          SizedBox(height: height / 20),
          Row(
            children: [
              SizedBox(width: width / 12),
              Text(
                'Upload Image',
                style: TextStyle(
                  color: Color(0xFF207dff),
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          ),
          SizedBox(height: height / 50),
          image != null
              ? Container(
                  width: width / 1.3,
                  height: height / 3,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
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
                    border: Border.all(color: Colors.blue),
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
                  setState(() {
                    PickImage();
                  });
                },
              ),
              // SizedBox(height: height / 40),
              DashboardButtons(
                text: 'Save',
                onTap: () {
                  image != null
                      ? Navigator.of(context).pop()
                      : showError('error', 'Image is required.');
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (_) => DashboardScreen(),
                  //   ),
                  // );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
