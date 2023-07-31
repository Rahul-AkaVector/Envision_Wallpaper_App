import 'package:flutter/material.dart';

import '../screens/Wallpapers/home.dart';

class CategoryBlock extends StatelessWidget {
  final String cat;
  // ignore: non_constant_identifier_names
  final String cover_link;
  // ignore: non_constant_identifier_names
  const CategoryBlock({super.key, required this.cat, required this.cover_link});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Home(
                categoryTitle: cat,
              ),
            ),
          );
        },
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                image: AssetImage(cover_link),
                fit: BoxFit.cover,
              ),
            ),
            height: 150,
            child: Center(
              child: Stack(
                children: [
                  // Shadowtext
                  Text(
                    cat,
                    style: const TextStyle(
                      fontSize: 60,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      shadows: [
                        Shadow(
                          blurRadius: 1.0, // border
                          color: Colors.black,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                  ),
                  // Maintext
                  Text(
                    cat,
                    style: const TextStyle(
                      fontSize: 60,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
