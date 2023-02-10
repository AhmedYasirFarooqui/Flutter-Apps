// ignore_for_file: unused_local_variable, must_be_immutable, unused_field

import 'dart:developer';

import 'package:flutter/material.dart';
// import 'package:quiz_app/quiz_screen.dart';
import 'package:quiz_app/topic_wise_quiz.dart';
import 'package:quiz_app/utils/assets.dart';
import 'package:quiz_app/utils/colors.dart';
import 'package:quiz_app/utils/widgets/buttons.dart';
import 'package:quiz_app/utils/widgets/textfield.dart';
import 'package:quiz_app/utils/widgets/title.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late AnimationController _formPopUpController;
  late AnimationController _anotherFormPopUpController;
  late final AnimationController _pageController;
  late final Animation<double> _pageAnimation;
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _anotherFormKey = GlobalKey<FormState>();
  bool _isHidden = true;
  // bool showLoginForm = false;
  // bool showSignUpForm = false;
  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  // Route _createRoute() {
  //   return PageRouteBuilder(
  //     pageBuilder: (context, animation, secondaryAnimation) =>
  //         const TopicWiseQuizScreen(),
  //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
  //       const begin = Offset(1.0, 0.0);
  //       const end = Offset.zero;
  //       const curve = Curves.ease;
  //       var tween =
  //           Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
  //       final offsetAnimation = animation.drive(tween);
  //       return SlideTransition(
  //         position: offsetAnimation,
  //         child: child,
  //       );
  //     },
  //   );
  // }

  @override
  void initState() {
    _formPopUpController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _anotherFormPopUpController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    // _pageController = AnimationController(
    //   duration: const Duration(milliseconds: 800),
    //   vsync: this,
    // );
    // _pageAnimation = CurvedAnimation(
    //   parent: _pageController,
    //   curve: Curves.fastOutSlowIn,
    // );
    // _pageController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _formPopUpController.dispose();
    _anotherFormPopUpController.dispose();
    //_pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.booksWallpaper),
            fit: BoxFit.cover,
            repeat: ImageRepeat.noRepeat,
            opacity: 0.3,
          ),
        ),
        child: Stack(
          children: [
            Container(
              width: width,
              height: height,
              color: Colors.transparent,
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: height * 0.17),
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: AppColors.lightGreen,
                      child: Center(
                        child: SizedBox(
                          width: width * 0.13,
                          child: Hero(
                            tag: 'bulb',
                            child: Image.asset(Assets.bulb),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.06),
                    const Text(
                      'Quizzler',
                      style: TextStyle(
                        color: AppColors.green,
                        fontSize: 35.0,
                      ),
                    ),
                    SizedBox(height: height * 0.06),
                    CustomButtons(
                      onTap: () {
                        setState(() {
                          //showLoginForm = true;
                          _formPopUpController.forward();
                        });
                      },
                      buttonColor: AppColors.lightGreen,
                      text: 'Login',
                      textColor: AppColors.white,
                      height: height * 0.06,
                    ),
                    SizedBox(height: height * 0.03),
                    CustomButtons(
                      onTap: () {
                        setState(() {
                          //showSignUpForm = true;
                          _anotherFormPopUpController.forward();
                        });
                      },
                      buttonColor: AppColors.lightGreen,
                      text: 'Sign Up',
                      textColor: AppColors.white,
                      width: width * 0.8,
                      height: height * 0.06,
                    ),
                    SizedBox(height: height * 0.03),
                    // CustomButtons(
                    //   onTap: () => Navigator.of(context).push(
                    //     MaterialPageRoute(
                    //       builder: (_) => const TopicWiseQuizScreen(),
                    //     ),
                    //   ),
                    //   buttonColor: AppColors.transparent,
                    //   text: 'Enter As Guest',
                    //   textColor: AppColors.green,
                    //   height: height * 0.06,
                    // ),
                    TextButton(
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const TopicWiseQuizScreen(),
                        ),
                      ),
                      child: const Text(
                        'Enter as Guest',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.green,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.07),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialSignInButtons(
                          image: Assets.googlelogo,
                          onTap: () {},
                        ),
                        SizedBox(width: width * 0.2),
                        SocialSignInButtons(
                          image: Assets.facebooklogo,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            //LOGIN FORM
            // showLoginForm == true
            //     ?
            SlideTransition(
              position:
                  Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
                      .animate(_formPopUpController),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.lightGreen,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: width * 0.93,
                  height: height * 0.78,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: width * 0.7),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _formPopUpController.reverse();
                              });
                            },
                            child: const Icon(
                              Icons.close_rounded,
                              color: AppColors.white,
                              size: 40.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.05),
                      const TitleOrDescription(
                        text: 'Log In',
                        fontSize: 35.0,
                      ),
                      SizedBox(height: height * 0.05),
                      const TitleOrDescription(
                        text: 'Login to your account',
                        fontSize: 18.0,
                      ),
                      SizedBox(height: height * 0.05),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFields(
                              hintText: 'Email',
                              controller: email,
                              icon: Icons.email,
                              isObscure: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'field must not be empty';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: height * 0.03),
                            TextFields(
                              hintText: 'Password',
                              controller: password,
                              icon: Icons.lock,
                              isObscure: _isHidden,
                              onTap: _togglePasswordView,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'field must not be empty';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.04),
                      CustomButtons(
                        height: height * 0.06,
                        onTap: () {
                          // if (_formKey.currentState!.validate()) {
                          //   log('all good here.');
                          // }
                        },
                        buttonColor: AppColors.white,
                        textColor: AppColors.lightGreen,
                        text: 'Log In',
                      ),
                      SizedBox(height: height * 0.04),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot Password',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // : const SizedBox(),
            //SignUp FORM
            // showSignUpForm == true
            //     ?
            SlideTransition(
              position:
                  Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
                      .animate(_anotherFormPopUpController),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.lightGreen,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: width * 0.93,
                  height: height * 0.78,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(),
                          InkWell(
                            onTap: () {
                              //showSignUpForm = false;

                              setState(() {
                                _anotherFormPopUpController.reverse();
                              });
                            },
                            child: const Icon(
                              Icons.close_rounded,
                              color: AppColors.white,
                              size: 40.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.03),
                      const TitleOrDescription(
                        text: 'Sign Up',
                        fontSize: 35.0,
                      ),
                      SizedBox(height: height * 0.05),
                      const TitleOrDescription(
                        text: 'Create a new account',
                        fontSize: 18.0,
                      ),
                      SizedBox(height: height * 0.05),
                      Form(
                        key: _anotherFormKey,
                        child: Column(
                          children: [
                            TextFields(
                              hintText: 'Username',
                              controller: username,
                              icon: Icons.person,
                              isObscure: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'field must not be empty';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: height * 0.03),
                            TextFields(
                              hintText: 'Email',
                              controller: email,
                              icon: Icons.email,
                              isObscure: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'field must not be empty';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: height * 0.03),
                            TextFields(
                              hintText: 'Password',
                              controller: password,
                              icon: Icons.lock,
                              isObscure: _isHidden,
                              onTap: _togglePasswordView,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'field must not be empty';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.04),
                      CustomButtons(
                        height: height * 0.06,
                        onTap: () {
                          if (_anotherFormKey.currentState!.validate()) {
                            log('all good here too.');
                          }
                        },
                        buttonColor: AppColors.white,
                        textColor: AppColors.lightGreen,
                        text: 'Sign Up',
                      ),
                    ],
                  ),
                ),
              ),
            )
            // : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
