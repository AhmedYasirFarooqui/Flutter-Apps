// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:pos_app/dashboard/profile.dart';
import 'package:pos_app/modals/matric_courses_modal.dart';

import '../custom-widgets/custom_options.dart';
// import '../modals/cambridge_courses_modal.dart';
import '../http-services/cambridge_course_api_srevice.dart';
import '../http-services/matric_course_api_service.dart';
import '../modals/cambridge_courses_modal.dart';
import 'courses.dart';
// import 'matric_courses.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<Widget> screens() {
    return [
      HomePage(),
      MyCoursesPage(),
      MyCoursesPage(),
      ProfilePage(),
    ];
  }

  List<PersistentBottomNavBarItem> navbarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: 'Home',
        activeColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.shopping_cart),
        title: 'My Cart',
        activeColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.book),
        title: 'All Courses',
        activeColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: 'Profile',
        activeColorPrimary: Colors.white,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        resizeToAvoidBottomInset: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 115, 191, 67),
        context,
        screens: screens(),
        items: navbarItems(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MatricApiService anotherClient = MatricApiService();
  CambridgeApiService finalClient = CambridgeApiService();
  List<MatricDatum>? matricCourses;
  List<CambridgeDatum>? cambridgeCourses;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          opacity: 0.1,
          image: AssetImage('assets/images/books.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: height / 12),
          Row(
            children: [
              SizedBox(width: width / 20),
              CircleAvatar(
                radius: 20.0,
                backgroundImage: AssetImage('assets/images/me.jpeg'),
              ),
              SizedBox(width: width / 20),
              Text(
                'Welcome, Yasir',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: height / 12),
          Text(
            'Dashboard',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: height / 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomOptions(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Courses(
                        title: 'Matric Courses',
                        future: anotherClient.getMatricCourses(),
                        courses: matricCourses,
                      ),
                    ),
                  );
                },
                text: 'Matric',
              ),
              SizedBox(
                width: width / 17,
              ),
              CustomOptions(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Courses(
                        title: 'Cambridge Courses',
                        future: finalClient.getCambridgeCourses(),
                        courses: cambridgeCourses,
                      ),
                    ),
                  );
                },
                text: "Cambridge",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyCoursesPage extends StatefulWidget {
  const MyCoursesPage({super.key});

  @override
  State<MyCoursesPage> createState() => _MyCoursesPageState();
}

class _MyCoursesPageState extends State<MyCoursesPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('My Courses')),
    );
  }
}
