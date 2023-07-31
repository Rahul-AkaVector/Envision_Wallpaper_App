import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
// import 'package:vector/main2.dart';
// import 'package:vector/views/screens/Home%20Screen/Home.dart';
// import 'package:vector/views/screens/Navigation%20Bar/navbar.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int activeIndex = 0;
  final urlImages = [
    'assets/HomeScreenCovers/Home_screen_cover1.jpg',
    'assets/HomeScreenCovers/Home_screen_cover2.jpg',
    'assets/HomeScreenCovers/Home_screen_cover3.jpg',
    'assets/HomeScreenCovers/Home_screen_cover4.jpg',
    'assets/HomeScreenCovers/Home_screen_cover5.jpeg'
  ];

  final List<String> carouselTexts = [
    "Text 1",
    "Text 2",
    "Text 3",
    "Text 4",
    "Text 5",
  ];

  Widget buildIndicator() => AnimatedSmoothIndicator(
      effect: ExpandingDotsEffect(
          dotHeight: 11,
          dotWidth: 13,
          dotColor: Color.fromARGB(169, 255, 255, 255),
          activeDotColor: Color.fromARGB(69, 255, 255, 255)),
      activeIndex: activeIndex,
      count: urlImages.length);

  Widget buildImage(String urlImage, int index, String text) => Container(
        width: MediaQuery.of(context).size.width * 0.66,
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(35),
          child: Stack(
            children: [
              Image.asset(
                urlImage,
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
              Positioned.fill(
                child: Container(
                  padding: EdgeInsets.all(10),
                  color: const Color.fromARGB(0, 0, 0, 0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      text = "", //just remove the ="" to use text on carousels
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          RiveAnimation.asset(
            'assets/RiveAssets/bg2.riv',
            fit: BoxFit.contain,
          ),
          Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            bottom: 300,
            left: 300,
            child: Image.asset('assets/Backgrounds/Spline.png'),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
              child: SizedBox(),
            ),
          ),
          const RiveAnimation.asset('assets/RiveAssets/bg2.riv'),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: SizedBox(),
            ),
          ),
          SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    SizedBox(
                      width: 400,
                      // width: 300,
                      // width: 250,
                      child: Column(
                        children: [
                          SizedBox(height: 85),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 100, 0),
                            child: SizedBox(
                              // width: 250,
                              child: Text(
                                'Elevate Your Screen',
                                style: TextStyle(
                                  fontSize: 60,
                                  fontFamily: 'Poppins',
                                  height: 1.2,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 100, 0),
                            child: SizedBox(
                              width: 250,
                              child: Text(
                                "Welcome to Envision, where inspiration meets customization. Discover an extensive collection of stunning wallpapers handpicked just for you. From nature's beauty to abstract art, explore and select the perfect wallpaper to make your device truly yours.",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Intel',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(height: 50),
                          //start here
                          SizedBox(
                            width: 350,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CarouselSlider.builder(
                                    itemCount: urlImages.length,
                                    itemBuilder: (context, index, realIndex) {
                                      final urlImage = urlImages[index];
                                      final carouselText = carouselTexts[index];
                                      return buildImage(
                                          urlImage, index, carouselText);
                                    },
                                    options: CarouselOptions(
                                      height: 300,
                                      onPageChanged: (index, reason) =>
                                          setState(() => activeIndex = index),
                                      autoPlay: true,
                                      autoPlayInterval:
                                          const Duration(seconds: 3),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          buildIndicator(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: Main2(),
    );
  }
}

// Widget buildImage(String urlImage, int index) => Container(
//       margin: EdgeInsets.symmetric(horizontal: 5),
//       child: Image.asset(
//         urlImage,
//         fit: BoxFit.cover,
//       ),
//     );
