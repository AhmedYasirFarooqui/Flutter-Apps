// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'Utility.dart';
import 'DBHelper.dart';
import 'Photo.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',
      home: SaveImageDemoSQLite(),
    );
  }
}

class SaveImageDemoSQLite extends StatefulWidget {
  //
  const SaveImageDemoSQLite({super.key});

  final String title = "Flutter Save Image";

  @override
  _SaveImageDemoSQLiteState createState() => _SaveImageDemoSQLiteState();
}

class _SaveImageDemoSQLiteState extends State<SaveImageDemoSQLite> {
  //
  XFile? imageFile;
  Image? image;
  DBHelper? dbHelper;
  List<Photo>? images;

  @override
  void initState() {
    super.initState();
    images = [];
    dbHelper = DBHelper();
    refreshImages();
  }

  refreshImages() {
    try {
      dbHelper!.getPhotos().then((imgs) {
        setState(() {
          images!.clear();
          images!.addAll(imgs);
        });
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  pickImageFromGallery() {
    try {
      ImagePicker()
          .pickImage(source: ImageSource.gallery)
          .then((imgFile) async {
        String imgString = Utility.base64String(await imgFile!.readAsBytes());
        // imageFile = imgFile!;
        Photo photo = Photo(0, imgString);
        debugPrint(imgString.length.toString());
        dbHelper!.save(photo);
        refreshImages();
      });
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
  }

  gridView() {
    return images != null
        ? Padding(
            padding: EdgeInsets.all(5.0),
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 1.0,
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              children: images!.map((photo) {
                return Utility.imageFromBase64String(photo.photo_name);
              }).toList(),
            ),
          )
        : CircularProgressIndicator();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              pickImageFromGallery();
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: gridView(),
            )
          ],
        ),
      ),
    );
  }
}
