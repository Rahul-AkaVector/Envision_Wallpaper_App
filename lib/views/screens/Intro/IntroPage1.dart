import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Intro1 extends StatelessWidget {
  const Intro1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF111111),
      // child: Container(
      //     child: Lottie.network(
      //         'https://assets6.lottiefiles.com/packages/lf20_hrmx64df.json',))
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Welcome to Envision ",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Discover Stunning Wallpapers',
            style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontFamily: 'Intel'),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Container(
              height: 350,
              child: Lottie.network(
                'https://assets8.lottiefiles.com/packages/lf20_ffjg0hfd.json',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
