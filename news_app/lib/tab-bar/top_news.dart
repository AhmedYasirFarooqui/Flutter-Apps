// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, unused_import, non_constant_identifier_names, avoid_types_as_parameter_names

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:news_app/custom.dart';
import 'package:news_app/modals/news_modal.dart';
import 'package:news_app/services/api_service.dart';

import '../news.dart';
import '../utils/colors.dart';

class TopNewsTab extends StatefulWidget {
  const TopNewsTab({Key? key}) : super(key: key);

  @override
  State<TopNewsTab> createState() => _TopNewsTabState();
}

class _TopNewsTabState extends State<TopNewsTab> {
  ApiService client = ApiService();

  late Future<Article> futureArticles;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          // CarouselSlider(
          //   options: CarouselOptions(
          //     height: 180.0,
          //     autoPlay: true,
          //     aspectRatio: 16 / 9,
          //     autoPlayCurve: Curves.fastOutSlowIn,
          //     enlargeCenterPage: true,
          //     enableInfiniteScroll: true,
          //     autoPlayAnimationDuration: const Duration(
          //       milliseconds: 900,
          //     ),
          //     viewportFraction: 0.8,
          //   ),
          //   items: [
          //     CustomCarouselOptions(
          //       'assets/images/tech.jpg',
          //       'Apple will reportedly sell the iPhone as a subscription service.',
          //     ),
          //     CustomCarouselOptions(
          //       'assets/images/sports.jpg',
          //       'Messi bids tearful goodbye to Barcelona after 21 years.',
          //     ),
          //     CustomCarouselOptions(
          //       'assets/images/business.jpg',
          //       'Pakistani Ruppee among the worst performing currencies.',
          //     ),
          //   ],
          // ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 170.0),
            child: Text(
              'Latest news',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w700,
                color: AppColors.red,

              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: FutureBuilder(
                future: client.GetArticle(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Article>> snapshot) {
                  if (snapshot.hasData) {
                    List<Article>? articles = snapshot.data;

                    return ListView.builder(
                      itemCount: articles!.length,
                      itemBuilder: (context, index) {
                        String selectedDate = DateFormat('hh:mm')
                            .format(articles[index].publishedAt!);
                        return CustomNewsCards(
                          imgPath: articles[index].urlToImage != null &&
                                  articles[index].urlToImage!.isNotEmpty
                              ? '${articles[index].urlToImage}'
                              : 'https://static.vecteezy.com/system/resources/thumbnails/004/141/669/small/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg',
                          headline: articles[index].title,
                          date: selectedDate,
                          time: 'Just Now.',
                          onTap: () async => await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => NewsScreen(
                                imgPath: articles[index].urlToImage ??
                                    'https://static.vecteezy.com/system/resources/thumbnails/004/141/669/small/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg',
                                headline: '${articles[index].title}',
                                date: selectedDate,
                                source: articles[index].source != null
                                    ? articles[index].source!.name
                                    : 'Unkown',
                                title: articles[index].title,
                                description: articles[index].description,
                                content: articles[index].content,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
