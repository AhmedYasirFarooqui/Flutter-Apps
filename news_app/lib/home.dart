// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:news_app/bottom-navigation-bar/settings.dart';
import 'package:news_app/utils/colors.dart';

import 'Tab-Bar/top_news.dart';
import 'bottom-navigation-bar/bookmarks.dart';
import 'bottom-navigation-bar/search.dart';
import 'custom.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 150.0,
              child: DrawerHeader(
                curve: Curves.easeIn,
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.only(
                  //   bottomLeft: Radius.circular(50.0),
                  //   bottomRight: Radius.circular(150.0),
                  // ),
                  color: AppColors.red,
                ),
                child: Row(
                  children: [
                    Image(
                      image: AssetImage('assets/images/globe.gif'),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                      width: 130.0,
                      height: 40.0,
                      child: Center(
                        child: Text(
                          'NEWS ROOM',
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.none,
                            color: AppColors.red,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CustomLisTile(
              icon: Icon(
                Icons.share,
                color: AppColors.red,
              ),
              text: 'Share App',
              fontSize: 17.0,
              onTap: () {},
            ),
            CustomLisTile(
              icon: Icon(
                Icons.star,
                color: AppColors.red,
              ),
              text: 'Rate App',
              fontSize: 17.0,
              onTap: () {},
            ),
            CustomLisTile(
              icon: Icon(
                Icons.mic,
                color: AppColors.red,
              ),
              text: 'Podcasts',
              fontSize: 17.0,
              onTap: () {},
            ),
            CustomLisTile(
              icon: Icon(
                Icons.people,
                color: AppColors.red,
              ),
              text: 'Talk Shows',
              fontSize: 17.0,
              onTap: () {},
            ),
            CustomLisTile(
              icon: Icon(
                Icons.facebook,
                color: AppColors.red,
              ),
              text: 'Facebook',
              fontSize: 17.0,
              onTap: () {},
            ),
            CustomLisTile(
              icon: Icon(
                Icons.camera_alt,
                color: AppColors.red,
              ),
              text: 'Instagram',
              fontSize: 17.0,
              onTap: () {},
            ),
            SizedBox(
              height: 15.0,
            ),
            Center(
              child: Text(
                'copyright @NewsRoom',
                style: TextStyle(
                  fontSize: 15.0,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 50.0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              size: 20.0,
            ),
          ),
        ],
        backgroundColor: AppColors.red,
        elevation: 0.0,
        centerTitle: true,
        title: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(3.0),
          ),
          width: 130.0,
          height: 40.0,
          child: Center(
            child: Text(
              'NEWS ROOM',
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.none,
                color: AppColors.red,
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          topTabBar(),
          SearchPage(),
          BookmarksScreen(),
          SettingsPage(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.red,
        child: Container(
          height: 50.0,
          child: TabBar(
            controller: _tabController,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                width: 2.0,
                color: AppColors.white!,
              ),
            ),
            labelColor: AppColors.white!,
            tabs: [
              Tab(
                icon: Icon(
                  Icons.home,
                  size: 18.0,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.search,
                  size: 18.0,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.bookmark,
                  size: 18.0,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.settings,
                  size: 18.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class topTabBar extends StatefulWidget {
  const topTabBar({Key? key}) : super(key: key);

  @override
  _topTabBarState createState() => _topTabBarState();
}

// ignore: camel_case_types
class _topTabBarState extends State<topTabBar>
    with SingleTickerProviderStateMixin {
  // ignore: non_constant_identifier_names
  late TabController _TabController;

  @override
  void initState() {
    super.initState();
    _TabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _TabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          color: AppColors.red,
          child: TabBar(
            isScrollable: true,
            controller: _TabController,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                width: 2.0,
                color: AppColors.white!,
              ),
            ),
            tabs: [
              Tab(
                child: Text(
                  'Top News',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Business',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Science',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Politics',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Sports',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _TabController,
        children: [
          TopNewsTab(),
          Center(
            child: Text('Business'),
          ),
          Center(
            child: Text('Science'),
          ),
          Center(
            child: Text('Politics'),
          ),
          Center(
            child: Text('Sports'),
          ),
        ],
      ),
    );
  }
}
