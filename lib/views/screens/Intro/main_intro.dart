// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vector/main2.dart';
// import 'package:vector/views/screens/Home%20Screen/Home.dart';
import 'package:vector/views/screens/Intro/IntroPage1.dart';
import 'package:vector/views/screens/Intro/IntroPage2.dart';
import 'package:vector/views/screens/Intro/IntroPage3.dart';
import 'package:vector/views/screens/Intro/IntroPage4.dart';

class MainIntro extends StatefulWidget {
  const MainIntro({super.key});

  @override
  State<MainIntro> createState() => _MainIntroState();
}

class _MainIntroState extends State<MainIntro> {
  PageController controller = PageController();
  bool onLastPage = false;

  // Future<void> setOnboardingCompleted() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setBool('showOnboarding', false);
  // }

  _storeOnBoardInfo() async {
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 3);
              });
            },
            children: const [
              Intro1(),
              Intro2(),
              Intro3(),
              Intro4(),
            ],
          ),
          Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                    onTap: () {
                      controller.jumpToPage(3);
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                SmoothPageIndicator(
                  controller: controller,
                  count: 4,
                ),
                onLastPage
                    ? GestureDetector(
                        onTap: () async {
                          // setOnboardingCompleted();
                          await _storeOnBoardInfo();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Main2(); // HOME PAGE
                              },
                            ),
                          );
                        },
                        child: Text(
                          'Done',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          controller.nextPage(
                              duration: Duration(milliseconds: 400),
                              curve: Curves.linear);
                        },
                        child: Text(
                          'Next',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
