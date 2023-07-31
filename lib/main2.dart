import 'package:flutter/material.dart';
// import 'package:vector/views/screens/Account/account.dart';
// import 'package:vector/views/screens/Favourites/favourites.dart';
import 'package:vector/views/screens/Home%20Screen/home_screen.dart';
import 'package:vector/views/screens/Navigation%20Bar/navigationBar.dart';
// import 'package:vector/views/screens/Wallpaper%20Category/category.dart';

class Main2 extends StatefulWidget {
  const Main2({super.key});

  @override
  State<Main2> createState() => _Main2State();
}

class _Main2State extends State<Main2> {
  // int index = 0;
  // final screens = [
  //   Home(),
  //   Search(),
  //   Favourites(),
  //   Account(),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Home(),
      bottomNavigationBar: NBar(),

      // bottomNavigationBar: NavigationBarTheme(
      //   data: NavigationBarThemeData(
      //       backgroundColor: Colors.black,
      //       indicatorColor: Colors.grey[600],
      //       labelTextStyle: MaterialStatePropertyAll(TextStyle(
      //           fontSize: 12,
      //           // fontWeight: FontWeight.w500,
      //           fontFamily: 'Intel',
      //           color: Colors.white))),
      //   child: NavigationBar(
      //     height: 60,
      //     backgroundColor: Colors.black,
      //     selectedIndex: index,
      //     onDestinationSelected: (index) => setState(() {
      //       this.index = index;
      //     }),
      //     destinations: [
      //       NavigationDestination(
      //         icon: Icon(Icons.home),
      //         label: 'Home',
      //       ),
      //       NavigationDestination(
      //         icon: Icon(Icons.search),
      //         label: 'Search',
      //       ),
      //       NavigationDestination(
      //         icon: Icon(Icons.favorite),
      //         label: 'Favourite',
      //       ),
      //       NavigationDestination(
      //         icon: Icon(Icons.settings),
      //         label: 'Settings',
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
