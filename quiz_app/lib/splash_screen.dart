// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quiz_app/home.dart';
import 'package:quiz_app/utils/assets.dart';
import 'package:quiz_app/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  bool completed = false;

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => MyHomePage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) completed = true;
        setState(() {});
      });
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: AppColors.lightGreen,
        child: Column(
          children: [
            SizedBox(height: height * 0.3),
            ScaleTransition(
              scale: _animation,
              child: CircleAvatar(
                radius: 80,
                backgroundColor: AppColors.white,
                child: Center(
                  child: SizedBox(
                    width: width * 0.2,
                    child: Hero(
                      tag: 'bulb',
                      child: Image.asset(Assets.bulb),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.3),
            completed == true
                ? FloatingActionButton(
                    elevation: 0.0,
                    onPressed: () {
                      Navigator.of(context).push(
                        _createRoute(),
                      );
                    },
                    backgroundColor: AppColors.white,
                    child: Center(
                      child: Icon(
                        Icons.arrow_right_rounded,
                        size: 60.0,
                        color: AppColors.lightGreen,
                      ),
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
