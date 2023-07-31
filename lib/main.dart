import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vector/main2.dart';
// import 'package:vector/main2.dart';
import 'package:vector/views/screens/Intro/main_intro.dart';

import 'firebase_options.dart';

// import 'package:vector/main2.dart';
// import 'package:vector/views/screens/Navigation%20Bar/navigationBar.dart';
// import 'package:vector/views/screens/Intro/main_intro.dart';
int? isViewed;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getInt('onBoard');

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vector appps',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      // home: Main2(),
      home: isViewed != 0 ? MainIntro() : Main2(),
    );
  }
}
