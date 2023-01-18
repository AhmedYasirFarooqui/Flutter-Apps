// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomRecentlyAddedCourses extends StatefulWidget {
  const CustomRecentlyAddedCourses({
    super.key,
    this.title,
    this.onTap,
    this.backgroundColor = Colors.white,
    this.imgPath,
    this.price,
  });
  final String? imgPath;
  final String? title;
  final String? price;
  final VoidCallback? onTap;
  final Color backgroundColor;

  @override
  State<CustomRecentlyAddedCourses> createState() =>
      _CustomRecentlyAddedCoursesState();
}

class _CustomRecentlyAddedCoursesState
    extends State<CustomRecentlyAddedCourses> {
  double rating = 0.0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width / 1.4,
      height: height / 2.85,
      child: InkWell(
        onTap: widget.onTap,
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 1.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: widget.backgroundColor,
          child: Column(
            children: [
              Container(
                width: width,
                height: height / 6,
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage(widget.imgPath!),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RatingBar.builder(
                      itemSize: 20.0,
                      minRating: 1,
                      initialRating: 5,
                      allowHalfRating: true,
                      itemBuilder: ((context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          )),
                      onRatingUpdate: (rating) => setState(() {
                        this.rating = rating;
                      }),
                    ),
                    SizedBox(width: width / 3.2),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    widget.title!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(width: width / 4.5),
                  Text(
                    widget.price!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height / 25),
              Padding(
                padding: EdgeInsets.only(left: 180.0),
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    'Details',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Color.fromARGB(255, 115, 191, 67),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }
}
