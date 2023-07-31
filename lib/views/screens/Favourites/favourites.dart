import 'package:flutter/material.dart';
// import 'package:vector/views/screens/Navigation%20Bar/navbar.dart';

import '../Navigation Bar/navigationBar.dart';
import '../Wallpapers/home.dart';

class Favourites extends StatefulWidget {
  const Favourites({super.key});

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Home(categoryTitle: 'Vector'),
      ),
      bottomNavigationBar: NBar(),
    );
  }
}
