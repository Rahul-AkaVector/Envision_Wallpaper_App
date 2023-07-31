import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vector/views/screens/Wallpapers/image_view.dart';

class Home extends StatefulWidget {
  final String categoryTitle;
  Home({super.key, required this.categoryTitle});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> items = [
    "Latest",
    "Oldest",
    "Popular",
    "Top",
    "Vector' Fav",
    "Upcoming"
  ];
  List<bool> values = [true, false, true, false, true, false];
  int current = 0;
  ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          widget.categoryTitle,
          style: GoogleFonts.laila(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: items.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                return Column(
                  children: [
                    const SizedBox(height: 2),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          current = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.all(5),
                        width: 80,
                        height: 40,
                        decoration: BoxDecoration(
                          color: current == index
                              ? Color.fromARGB(238, 255, 255, 255)
                              : const Color.fromARGB(44, 255, 255, 255),
                          borderRadius: current == index
                              ? BorderRadius.circular(25)
                              : BorderRadius.circular(20),
                          border: current == index
                              ? Border.all(color: Colors.white, width: 2)
                              : null,
                        ),
                        child: Center(
                          child: Text(
                            items[index],
                            style: GoogleFonts.laila(
                              fontWeight: FontWeight.w500,
                              color: current == index
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: current == index,
                      child: Container(
                        width: 7,
                        height: 5,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 2),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: ImageView(
                orderByDesc: values[current],
                category: widget.categoryTitle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}



// // import 'dart:html';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:vector/views/screens/Wallpapers/image_view.dart';
// // import 'package:walls/views/screens/image_view.dart';
// // import 'package:walls/views/widgets/CategoryBlock.dart';
// // import 'package:walls/views/widgets/CustomAppBar.dart';
// // import 'package:walls/views/widgets/SearchBar.dart';

// class Home extends StatefulWidget {
//   final String categoryTitle;
//   Home({super.key, required this.categoryTitle});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   List<String> items = [
//     "Latest",
//     "Oldest",
//   ];

//   /// List of body icon
//   List<bool> values = [true, false, true, false, true, false];
//   int current = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Colors.transparent,
//         title: Text(
//           widget.categoryTitle,
//           style: GoogleFonts.laila(
//             color: Colors.white,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           // SearchBar
//           children: [
//             SizedBox(
//               width: double.infinity,
//               height: 60,
//               child: ListView.builder(
//                   physics: const BouncingScrollPhysics(),
//                   itemCount: items.length,
//                   scrollDirection: Axis.horizontal,
//                   itemBuilder: (ctx, index) {
//                     return Column(
//                       children: [
//                         const SizedBox(
//                           height: 2,
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               current = index;
//                             });
//                           },
//                           child: AnimatedContainer(
//                             duration: const Duration(milliseconds: 300),
//                             margin: const EdgeInsets.all(5),
//                             width: 80,
//                             height: 40,
//                             decoration: BoxDecoration(
//                               color: current == index
//                                   ? Color.fromARGB(238, 255, 255, 255)
//                                   : const Color.fromARGB(44, 255, 255, 255),
//                               borderRadius: current == index
//                                   ? BorderRadius.circular(25)
//                                   : BorderRadius.circular(20),
//                               border: current == index
//                                   ? Border.all(color: Colors.white, width: 2)
//                                   : null,
//                             ),
//                             child: Center(
//                               child: Text(
//                                 items[index],
//                                 style: GoogleFonts.laila(
//                                     fontWeight: FontWeight.w500,
//                                     color: current == index
//                                         ? Colors.black
//                                         : Colors.white),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Visibility(
//                           visible: current == index,
//                           child: Container(
//                             width: 7,
//                             height: 5,
//                             decoration: const BoxDecoration(
//                                 color: Colors.white, shape: BoxShape.circle),
//                           ),
//                         ),
//                       ],
//                     );
//                   }),
//             ),
//             const SizedBox(
//               height: 6,
//             ),

//             // Container(
//             //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
//             //     child: SearchBars()),
//             // Category

//             // Container(
//             //   margin: EdgeInsets.symmetric(vertical: 20),
//             //   child: SizedBox(
//             //       height: 50,
//             //       width: MediaQuery.of(context).size.width,
//             //       child: ListView.builder(
//             //           scrollDirection: Axis.horizontal,
//             //           itemCount: 30,
//             //           itemBuilder: (context, index) => CategoryBlock())),
//             // ),

//             Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 5),
//                 height: MediaQuery.of(context).size.height,
//                 child: ImageView(
//                   orderByDesc: values[current],
//                   category: widget.categoryTitle,
//                 ))
//           ],
//         ),
//       ),
//     );
//   }
// }
