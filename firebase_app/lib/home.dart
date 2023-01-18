import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/post.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final postStream = FirebaseFirestore.instance.collection('posts').snapshots();

  final TextEditingController titleController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  String? imagePath;

  @override
  Widget build(BuildContext context) {
    Future<void> pickImage() async {
      try {
        final ImagePicker _picker = ImagePicker();
        // ignore: unused_local_variable
        final image = await _picker.pickImage(source: ImageSource.gallery);
        setState(() {
          imagePath = image!.path;
        });
      } catch (e) {
        print(e.toString());
      }
    }

    void submit() async {
      try {
        // ignore: unused_local_variable
        String title = titleController.text;
        // ignore: unused_local_variable
        String description = descriptionController.text;
        // ignore: unused_local_variable
        firebase_storage.FirebaseStorage storage =
            firebase_storage.FirebaseStorage.instance;
        // ignore: unused_local_variable
        firebase_storage.Reference ref =
            firebase_storage.FirebaseStorage.instance.ref(/*'/image.jpeg'*/);
        // ignore: unused_local_variable
        File file = File(imagePath!);
        await ref.putFile(file);
        print("File uploaded successfuly!");
      } catch (e) {
        print(e.toString());
      }
    }

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SafeArea(
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Enter title'),
              ),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Enter description'),
              ),
              ElevatedButton(
                onPressed: () => pickImage,
                child: Text("Pick Image"),
              ),
              SizedBox(
                height: 8.0,
              ),
              ElevatedButton(
                onPressed: () => submit,
                child: Text("Save Post"),
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: Container(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: postStream,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text('Something went wrong');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text("Loading");
                      }

                      return new ListView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: snapshot.data!.docs.map(
                          (DocumentSnapshot document) {
                            Map data = document.data() as Map<dynamic, dynamic>;
                            return Post(data);
                          },
                        ).toList(),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
