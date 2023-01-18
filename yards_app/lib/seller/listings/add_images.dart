// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:yards_app/seller/listings/add_location.dart';

// import 'add_details.dart';

class AddImagesScreen extends StatefulWidget {
  const AddImagesScreen({super.key});

  @override
  State<AddImagesScreen> createState() => _AddImagesScreenState();
}

class _AddImagesScreenState extends State<AddImagesScreen> {
  final GroupButtonController controller = GroupButtonController();
  final ImagePicker picker = ImagePicker();
  List<XFile>? imageFileList = [];

  void selectImages() async {
    try {
      final List<XFile>? selectedImages = await picker.pickMultiImage();
      if (selectedImages!.isNotEmpty) {
        imageFileList!.addAll(selectedImages);
      }

      debugPrint("length of list: ${imageFileList!.length}");
      setState(() {});
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: height / 20),
            const Text(
              'Add images of your listing.',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF163257),
              ),
            ),
            SizedBox(height: height / 130),
            const Text(
              'The first one will be the cover image',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF163257),
              ),
            ),
            SizedBox(height: height / 28),
            InkWell(
              onTap: () {
                selectImages();
              },
              child: Container(
                width: width / 2.4,
                height: height / 20,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.5,
                    color: Color(0xFF163257),
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    'Add Image',
                    style: TextStyle(
                      color: Color(0xFF163257),
                    ),
                  ),
                ),
              ),
            ),
            imageFileList != null
                ? Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemCount: imageFileList!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Image.file(
                            File(
                              imageFileList![index].path,
                            ),
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  )
                : Center(
                    child: Text(
                      'Nothing to show.',
                      style: TextStyle(
                        color: Color(0xFF163257),
                      ),
                    ),
                  ),
            // InkWell(
            //   onTap: () {},
            //   child: Container(
            //     width: width / 2.4,
            //     height: height / 20,
            //     decoration: BoxDecoration(
            //       border: Border.all(
            //         width: 1.5,
            //         color: Color(0xFF163257),
            //       ),
            //       borderRadius: BorderRadius.circular(10.0),
            //     ),
            //     child: Center(
            //       child: Text(
            //         'Upload Image',
            //         style: TextStyle(
            //           color: Color(0xFF163257),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
