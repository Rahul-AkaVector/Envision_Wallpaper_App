import 'package:flutter/material.dart';

import 'dart:math';
import 'dart:io';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

// ignore: must_be_immutable
class FullScreen extends StatelessWidget {
  final String imgUrl;

  var random = Random();
  Future<void> _saveImage(BuildContext context) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    late String message = "Wallpaper Not Saved ❌";

    try {
      // Download image
      final http.Response response = await http.get(Uri.parse(imgUrl));

      // Get temporary directory
      final dir = await getTemporaryDirectory();

      // Create an image name
      var filename =
          '${dir.path}/EnvisionWallpapers${random.nextInt(1000)}.png';

      // Save to filesystem
      final file = File(filename);
      await file.writeAsBytes(response.bodyBytes);

      // Asking to save image
      final params = SaveFileDialogParams(sourceFilePath: file.path);
      final finalPath = await FlutterFileDialog.saveFile(params: params);

      if (finalPath != null) {
        message = 'Wallpaper Saved ✅';
      }
    } catch (e) {
      message = e.toString();
      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: const Color.fromARGB(83, 0, 0, 0),
          duration: Duration(seconds: 1),
        ),
      );
    }

    // ignore: unnecessary_null_comparison
    if (message != null) {
      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: const Color.fromARGB(83, 0, 0, 0),
          duration: Duration(seconds: 1),
        ),
      );
    } else {
      print('error');
    }
  }

  FullScreen({super.key, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Download Started 🥳',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: const Color.fromARGB(83, 0, 0, 0),
              duration:
                  Duration(milliseconds: 500), // Set the duration to 1 second
            ),
          );
          _saveImage(context);
        },
        splashColor: Colors.white,
        backgroundColor: const Color.fromARGB(139, 255, 255, 255),
        child: Icon(
          Icons.download,
          color: Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image:
              DecorationImage(image: NetworkImage(imgUrl), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
