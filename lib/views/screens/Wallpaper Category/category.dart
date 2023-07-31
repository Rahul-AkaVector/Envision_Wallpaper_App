import 'package:flutter/material.dart';
// import 'package:vector/views/widgets/searchBar.dart';
import '../../widgets/category.dart';
import '../Navigation Bar/navigationBar.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final List<Map<String, dynamic>> categories = [
    {
      "category": "4K",
      "cover_link": 'assets/coverlinks/4K_cover.jpg',
    },
    {
      "category": "Abstract",
      "cover_link": 'assets/coverlinks/Abstract_cover.jpg',
    },
    {
      "category": "AI Arts",
      "cover_link": 'assets/coverlinks/AI_Arts_cover.jpg',
    },
    {
      "category": "Animals",
      "cover_link": 'assets/coverlinks/Animals_cover.jpg',
    },
    {
      "category": "Anime",
      "cover_link": 'assets/coverlinks/Anime_cover.jpg',
    },
    {
      "category": "Architectures",
      "cover_link": 'assets/coverlinks/Architectures_cover.jpg',
    },
    {
      "category": "B & W",
      "cover_link": 'assets/coverlinks/B_&_W_cover.jpg',
    },
    {
      "category": "Cars",
      "cover_link": 'assets/coverlinks/Cars_cover.jpg',
    },
    {
      "category": "CityScapes",
      "cover_link": 'assets/coverlinks/CityScapes_cover.jpg',
    },
    {
      "category": "Dark",
      "cover_link": 'assets/coverlinks/Dark_cover.jpg',
    },
    {
      "category": "Floral",
      "cover_link": 'assets/coverlinks/Floral_cover.jpeg',
    },
    {
      "category": "Games",
      "cover_link": 'assets/coverlinks/Games_cover.jpg',
    },
    {
      "category": "Japan",
      "cover_link": 'assets/coverlinks/Japan_cover.jpg',
    },
    {
      "category": "Minimalistic",
      "cover_link": 'assets/coverlinks/Minimalistic_cover.jpg',
    },
    {
      "category": "Nature",
      "cover_link": 'assets/coverlinks/Nature_cover.jpg',
    },
    {
      "category": "Neon Lights",
      "cover_link": 'assets/coverlinks/Neon_Lights_cover.jpg',
    },
    {
      "category": "Space",
      "cover_link": 'assets/coverlinks/Space_cover.jpg',
    },
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> foundCategories = [];
  @override
  initState() {
    foundCategories = categories;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    if (enteredKeyword.isEmpty) {
      // If the search field is empty or only contains white-space, display all users
      setState(() {
        foundCategories = categories;
      });
    } else {
      // Filter the categories based on the entered keyword
      setState(() {
        foundCategories = categories
            .where((category) => category["category"]
                .toLowerCase()
                .contains(enteredKeyword.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              // child: SearchBars(),
              child: Container(
                // color: Colors.black26,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: (value) => _runFilter(value),
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          hintText: "Search Wallpapers",
                          errorBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          print("srch");
                        },
                        child: Icon(
                          Icons.search,
                          color: Colors.black,
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: foundCategories.isNotEmpty
                  ? ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: foundCategories.length,
                      itemBuilder: (context, index) {
                        return CategoryBlock(
                          cat: foundCategories[index]["category"],
                          cover_link: foundCategories[index]["cover_link"],
                        );
                      },
                    )
                  : const Text(
                      'No results found',
                      style: TextStyle(fontSize: 24),
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NBar(),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:vector/views/widgets/searchBar.dart';
// import '../../widgets/category.dart';
// import '../Navigation Bar/navigationBar.dart';

// class Search extends StatefulWidget {
//   const Search({super.key});

//   @override
//   State<Search> createState() => _SearchState();
// }

// class _SearchState extends State<Search> {
//   final List category = [
//     "4K",
//     "Abstract",
//     "AI Arts",
//     "Animals",
//     "Anime",
//     "Architectures",
//     "B & W",
//     "Cars",
//     "CityScapes",
//     "Dark",
//     "Floral",
//     "Games",
//     "Japan",
//     "Minimalistic",
//     "Nature",
//     "Neon Lights",
//     "Space"
//   ];

//   final List covers = [
//     'assets/coverlinks/4K_cover.jpg',
//     'assets/coverlinks/Abstract_cover.jpg',
//     'assets/coverlinks/AI_Arts_cover.jpg',
//     'assets/coverlinks/Animals_cover.jpg',
//     'assets/coverlinks/Anime_cover.jpg',
//     'assets/coverlinks/Architectures_cover.jpg',
//     'assets/coverlinks/B_&_W_cover.jpg',
//     'assets/coverlinks/Cars_cover.jpg',
//     'assets/coverlinks/CityScapes_cover.jpg',
//     'assets/coverlinks/Dark_cover.jpg',
//     'assets/coverlinks/Floral_cover.jpeg',
//     'assets/coverlinks/Games_cover.jpg',
//     'assets/coverlinks/Japan_cover.jpg',
//     'assets/coverlinks/Minimalistic_cover.jpg',
//     'assets/coverlinks/Nature_cover.jpg',
//     'assets/coverlinks/Neon_Lights_cover.jpg',
//     'assets/coverlinks/Space_cover.jpg',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       body: SafeArea(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 20,
//             ),
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
//               child: SearchBars(),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: category.length,
//                 itemBuilder: (context, index) {
//                   return CategoryBlock(
//                     cat: category[index],
//                     cover_link: covers[index],
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: NBar(),
//     );
//   }
// }
