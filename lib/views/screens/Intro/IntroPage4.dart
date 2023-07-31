import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Intro4 extends StatelessWidget {
  const Intro4({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF111111),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Unleash Your Creativity",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),

            SizedBox(height: 10),

            Text(
              "Let's Get Started",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontFamily: 'Intel',
              ),
            ),

            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Container(
                height: 350,
                child: Lottie.network(
                  'https://assets9.lottiefiles.com/packages/lf20_dzkaf30m.json',
                ),
              ),
            ),
            // Adjust the spacing between the Lottie animation and the text
          ],
        ),
      ),
    );
  }
}
