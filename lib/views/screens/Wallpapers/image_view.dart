// import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vector/views/screens/Wallpapers/fullscreen.dart';
// import 'package:walls/views/screens/fullscreen.dart';

class ImageView extends StatelessWidget {
  final bool orderByDesc;
  final String category;
  const ImageView(
      {super.key, required this.orderByDesc, required this.category});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection(category)
          .orderBy('id', descending: orderByDesc)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: snapshot.data?.docs.length ?? 0,
            // itemCount: snapshot.hasData ? snapshot.data?.docs.length ?? 0 : 0,

            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 2 / 3,
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 10,
              mainAxisExtent: 400,
            ),
            itemBuilder: (context, index) {
              final data = snapshot.data?.docs[index];
              if (data == null) {
                return Container(
                  color: Colors.amber,
                );
              }
              String imageUrl = data.data()['url'];

              return ClipRRect(
                // borderRadius: BorderRadius.circular(15),
                child: Container(
                  // padding: EdgeInsets.all(1.0),
                  decoration: BoxDecoration(
                    border: const Border.fromBorderSide(
                      BorderSide(
                        color: Color.fromARGB(43, 255, 255, 255),
                        width: 1.0,
                        style: BorderStyle.solid,
                      ),
                    ),
                    borderRadius: BorderRadius.circular(15),
                    // color: Colors.white
                  ),
                  // child: Image.network(
                  //   imageUrl,
                  //   fit: BoxFit.cover,
                  // ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FullScreen(imgUrl: imageUrl),
                        ),
                      );
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.black,
                      ),
                      child: Hero(
                        tag: imageUrl,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
