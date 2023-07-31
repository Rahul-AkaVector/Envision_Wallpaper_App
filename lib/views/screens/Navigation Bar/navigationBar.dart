import 'package:flutter/material.dart';
import 'package:vector/main2.dart';
// import 'package:vector/views/screens/Account/account.dart';
import 'package:vector/views/screens/Favourites/favourites.dart';
import 'package:vector/views/screens/Wallpaper%20Category/category.dart';

class NBar extends StatefulWidget {
  const NBar({super.key});

  @override
  State<NBar> createState() => _NBarState();
}

class _NBarState extends State<NBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Search()),
                );
              });
            },
            icon: Icon(
              Icons.search_rounded,
              size: 30,
              color: Colors.white60,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Main2()),
                );
              });
            },
            icon: Icon(
              Icons.home_rounded,
              size: 30,
              color: Colors.white60,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Favourites()),
                );
              });
            },
            icon: Icon(
              Icons.favorite_outline_sharp,
              size: 30,
              color: Colors.white60,
            ),
          ),
          // IconButton(
          //   onPressed: () {
          //     setState(() {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => Account()),
          //       );
          //     });
          //   },
          //   icon: Icon(
          //     Icons.settings,
          //     size: 30,
          //     color: Colors.white60,
          //   ),
          // ),
        ],
      ),
    );
  }
}


// // .

// import 'package:flutter/material.dart';
// // import 'package:vector/main2.dart';
// import 'package:vector/views/screens/Favourites/favourites.dart';
// import 'package:vector/views/screens/Wallpaper%20Category/category.dart';

// import '../Home Screen/home_screen.dart';

// class NBar extends StatefulWidget {
//   const NBar({super.key});

//   @override
//   State<NBar> createState() => _NBarState();
// }

// class _NBarState extends State<NBar> {
//   int _currentIndex = 0;

//   final List<Widget> _pages = [
//     Search(),
//     Home(),
//     Favourites(),
//     // Account(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[_currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.search_rounded),
//             label: 'Search',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home_rounded),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite_outline_sharp),
//             label: 'Favourites',
//           ),
//           // BottomNavigationBarItem(
//           //   icon: Icon(Icons.settings),
//           //   label: 'Account',
//           // ),
//         ],
//       ),
//     );
//   }
// }
