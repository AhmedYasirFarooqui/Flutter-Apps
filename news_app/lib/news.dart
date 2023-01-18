import 'package:flutter/material.dart';
import 'package:news_app/utils/colors.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({
    Key? key,
    this.imgPath,
    this.headline,
    this.date,
    this.title,
    this.description,
    this.content,
    this.source,
  }) : super(key: key);
  final String? imgPath;
  final String? headline;
  final String? date;
  final String? title;
  final String? description;
  final String? content;
  final String? source;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                width: width,
                height: height / 3.1,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
                  color: AppColors.grey,
                  image: DecorationImage(
                    image: NetworkImage(imgPath ??
                        'https://static.vecteezy.com/system/resources/thumbnails/004/141/669/small/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_rounded,
                  color: AppColors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          const SizedBox(height: 30.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            width: width / 1.05,
            child: Text(
              title!,
              softWrap: true,
              textScaleFactor: 1.05,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.justify,
              maxLines: 3,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            width: width / 1.05,
            child: Text(
              description!,
              softWrap: true,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            width: width / 1.05,
            child: Text(
              content!,
              softWrap: true,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
