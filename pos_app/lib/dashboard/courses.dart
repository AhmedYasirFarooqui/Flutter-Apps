// ignore_for_file: prefer_const_constructors, unused_local_variable, must_be_immutable

import 'package:flutter/material.dart';
import 'package:pos_app/custom-widgets/custom_recently_added_courses.dart';
import 'package:pos_app/custom-widgets/custom_text_field.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:pos_app/http-services/matric_course_api_service.dart';
import 'package:pos_app/modals/images_modal.dart';
import '../custom-widgets/custom_class_options.dart';
// import '../http-services/cambridge_course_api_srevice.dart';
import '../http-services/image_api_service.dart';
// import '../modals/matric_courses_modal.dart';

class Courses extends StatefulWidget {
  Courses({super.key, this.future, this.title, this.courses});
  final Future? future;
  List? courses;
  final String? title;
  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  ImageApiService client = ImageApiService();
  // MatricApiService anotherClient = MatricApiService();
  // CambridgeApiService finalClient = CambridgeApiService();
  List<int> list = List.generate(10, (int i) => i + 1);
  int _current = 0;

  List<Color> colors = [
    Color.fromARGB(255, 255, 219, 219),
    Color.fromARGB(255, 207, 241, 251),
    Color.fromARGB(255, 214, 251, 228),
    Color.fromARGB(255, 252, 253, 205),
    Color.fromARGB(255, 255, 219, 219),
    Color.fromARGB(255, 207, 241, 251),
    Color.fromARGB(255, 214, 251, 228),
    Color.fromARGB(255, 252, 253, 205),
    Color.fromARGB(255, 255, 219, 219),
    Color.fromARGB(255, 207, 241, 251),
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight) * 2.6,
        child: Column(
          children: [
            SizedBox(height: height / 12),
            Row(
              children: [
                SizedBox(width: width / 14),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Color.fromARGB(255, 115, 191, 67),
                  ),
                ),
                SizedBox(width: width / 10),
                Text(
                  widget.title.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            CustomTextField(
              hinttext: 'search',
              icon: Icon(
                Icons.search,
                color: Color.fromARGB(255, 115, 191, 67),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 5.0,
            ),
            FutureBuilder(
              future: client.getImages(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Datum>>? snapshot) {
                if (snapshot!.hasData) {
                  List<Datum>? images = snapshot.data;
                  return Column(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                            aspectRatio: 2.2,
                            autoPlay: true,
                            enlargeCenterPage: true,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            }),
                        items: images!.map((image) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                    image: NetworkImage(image.img!),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: images.map((url) {
                          int index = images.indexOf(url);
                          return Container(
                            width: 8.0,
                            height: 8.0,
                            margin: EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 3,
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _current == index
                                  ? Color.fromARGB(255, 115, 191, 67)
                                  : Color.fromRGBO(0, 0, 0, 0.2),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            SizedBox(height: 20.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                children: List.generate(
                  list.length,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                        right: 8.0,
                        bottom: 8.0,
                      ),
                      child: CustomClasses(
                        text: 'Class ${index + 1}',
                        onTap: () {
                          debugPrint('$index');
                        },
                        backgroundColor: colors[index],
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Recently Added',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: width / 3),
                Text(
                  'See All',
                  style: TextStyle(
                    color: Color.fromARGB(255, 115, 191, 67),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: height / 50),
            FutureBuilder(
              future: widget.future,
              builder: (BuildContext context, AsyncSnapshot? snapshot) {
                if (snapshot!.hasData) {
                  widget.courses = snapshot.data;
                  var courseDetails = widget.courses!
                      .map(
                        (course) => {
                          "id": course.id,
                          "name": course.name,
                          "image": course.image,
                          "type": course.type,
                          "created at": course.createdAt,
                          "updated at": course.updatedAt,
                        },
                      )
                      .toList(growable: true);
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      children: List.generate(
                        courseDetails.length,
                        (index) {
                          return Container(
                            padding: const EdgeInsets.only(
                              left: 8.0,
                              right: 8.0,
                              bottom: 8.0,
                            ),
                            child: CustomRecentlyAddedCourses(
                              imgPath: 'assets/images/library.jpg',
                              onTap: () {},
                              title: courseDetails[index]['name'].toString(),
                              price: '\$12.99',
                              // backgroundColor: colors[index],
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            SizedBox(height: height / 25),
          ],
        ),
      ),
    );
  }
}
