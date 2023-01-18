// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int current = 0;
  final List<String> images = [
    'assets/images/thai-food.jpg',
    'assets/images/biryani.jpg',
    'assets/images/greek-food-2.jpg',
    'assets/images/burger.jpg',
  ];

  // final List<String> cuisines = [
  //   'Thai Cuisine',
  //   'Pakistani Cuisine',
  //   'Greek Cuisine',
  //   'American Cuisine',
  // ];
  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = images
        .map((item) => Container(
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    10.0,
                  ),
                ),
                child: Stack(
                  children: [
                    Image(
                      // opacity: ,
                      colorBlendMode: BlendMode.darken,
                      image: AssetImage(item),
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      height: 500.0,
                    ),
                    Positioned(
                      bottom: 10.0,
                      left: 10.0,
                      right: 0.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Food',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '10 places',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ))
        .toList();
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 9,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: "Search for restaurants...",
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 0.7),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 0.7),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ),
              ),
              // const SizedBox(
              //   height: 10.0,
              // ),
              CarouselSlider(
                items: imageSliders,
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 2,
                  onPageChanged: (index, reason) {
                    setState(() {
                      current = index;
                    });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: images.map((url) {
                  int index = images.indexOf(url);
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 3,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: current == index
                          ? Color.fromRGBO(0, 0, 0, 0.9)
                          : Color.fromRGBO(0, 0, 0, 0.4),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Most Popular',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                    ),
                  ),
                  SizedBox(
                    width: 120.0,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'See all',
                      style: TextStyle(
                        color: Colors.teal[400],
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: ListView(
                  itemExtent: 200.0,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(bottom: 30.0),
                  children: [
                    Cards(
                      imgPath: 'assets/images/kfc.jpg',
                      heading: 'KFC Broadway',
                      text1: '122 Queens Street',
                      text2: 'Fried Chicken, American',
                    ),
                    Cards(
                      imgPath: 'assets/images/greek-food.jpg',
                      heading: 'Greek House',
                      text1: '23 Queens Street',
                      text2: 'Food Mania',
                    ),
                    Cards(
                      imgPath: 'assets/images/italian.jpg',
                      heading: 'Italian Bistro',
                      text1: '20 Queens Street',
                      text2: 'Spicy Noodles',
                    ),
                    Cards(
                      imgPath: 'assets/images/turkish-food.jpg',
                      heading: 'Turkish Delight',
                      text1: '125 Queens Street',
                      text2: 'Turkish Kebabs',
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   height: 10.0,
              // ),
              // Expanded(
              //   child: ListView(
              //     itemExtent: 200.0,
              //     shrinkWrap: true,
              //     scrollDirection: Axis.horizontal,
              //     padding: EdgeInsets.only(bottom: 30.0),
              //     children: [
              //       Cards(
              //         imgPath: 'assets/images/kfc.jpg',
              //         heading: 'KFC Broadway',
              //         text1: '122 Queens Street',
              //         text2: 'Fried Chicken, American',
              //       ),
              //       Cards(
              //         imgPath: 'assets/images/greek-food.jpg',
              //         heading: 'Greek House',
              //         text1: '23 Queens Street',
              //         text2: 'Food Mania',
              //       ),
              //       Cards(
              //         imgPath: 'assets/images/italian.jpg',
              //         heading: 'Italian Bistro',
              //         text1: '20 Queens Street',
              //         text2: 'Spicy Noodles',
              //       ),
              //       Cards(
              //         imgPath: 'assets/images/turkish-food.jpg',
              //         heading: 'Turkish Delight',
              //         text1: '125 Queens Street',
              //         text2: 'Turkish Kebabs',
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}

class Cards extends StatelessWidget {
  const Cards({Key? key, this.imgPath, this.heading, this.text1, this.text2})
      : super(key: key);
  final String? imgPath;
  final String? heading;
  final String? text1;
  final String? text2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.grey[50],
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: AssetImage(imgPath!),
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  heading!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  text1!,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13.0,
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  text2!,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13.0,
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
