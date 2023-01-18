import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_viewer/SaveImage.dart';
import 'package:path_provider/path_provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ImagePicker _picker = ImagePicker();
  final box = GetStorage();
  List<SaveImage> images = [];
  // Pick an image
  Future pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      print('FILE PATH: ${image?.path}');
      if (image == null) return;
      //final save = SaveImage();
      String filename = image.path.split('/').last;
      final dir = await getExternalStorageDirectory();
      File file = File('${dir!.path}/$filename');
      final bytes = await image.readAsBytes();
      await file.open(mode: FileMode.write);
      await file.writeAsBytes(bytes);
      SaveImage saveImage = SaveImage(filename: filename, filepath: file.path);
      if (box.hasData('images')) {
        List temp = box.read('images');
        temp.add(saveImage.toJson());
        box.write('images', temp);
        print('image 1');
        print(temp.length);
      } else {
        box.write('images', [
          saveImage.toJson(),
        ]);
        print('image 2');
      }
      images.add(saveImage);
      setState(() {});
      //print();
      /*box.write('file', myfile);
    debugPrint(box.read(myfile.filepath!));*/
      /*debugPrint('image name: $filename');
    debugPrint(box.read('filepath'));
    debugPrint('image path: $imageTemporary');*/
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() {
    if (box.hasData('images')) {
      List newTemp = box.read('images');
      newTemp.forEach((element) {
        images.add(SaveImage.fromJson(element));
      });
      print('IMAGE: ${images.length}');
      setState(() {});
    } else {
      print('Nothing found!');
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        toolbarHeight: height / 12,
        title: const Text('Images'),
        centerTitle: true,
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          pickImage();
        },
        child: const Text(
          'Upload',
          style: TextStyle(fontSize: 16.0, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          return SizedBox(
            width: width / 4,
            height: height / 8,
            child: Card(
              child: Center(
                child: Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: FileImage(
                            File(images[index].filepath!),
                          ),
                          radius: 30.0,
                        ),
                        title: Text(images[index].filename!),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Image(
                                image: FileImage(
                                  File(images[index].filepath!),
                                ),
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        );
                      },
                      child: const Text('View'),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(
                          () {
                            images.removeAt(index);
                            box.erase();
                            box.write('images',
                                images.map((e) => e.toJson()).toList());
                          },
                        );
                      },
                      child: const Text('Delete'),
                    ),
                  ],
                ),
              ),
            ),
          );
          /*return Row(
            children: [
              */ /*CircleAvatar(
                backgroundImage:
                    FileImage(images[index].filepath as File),
                radius: 30.0,
              ),*/ /*
              Text(
                '${index + 1} |\t\t\t ${images[index].filename}',
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 70.0),
              TextButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Image(
                            image: FileImage(
                              File(images[index].filepath!),
                            ),
                            fit: BoxFit.cover,
                          ),
                        );
                      });
                },
                child: Text('View'),
              ),
            ],
          );*/
        },
      ),
    );
  }
}
