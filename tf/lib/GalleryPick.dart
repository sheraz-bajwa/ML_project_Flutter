import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:tf/Fonts.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image_picker/image_picker.dart';

class Gallery extends StatefulWidget {
  const Gallery({Key? key});

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  String output = "";
  PickedFile? selectedImage;

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/fyp1.tflite",
      labels: "assets/labels.txt",
    );
  }

  selectImage() async {
    final picker = ImagePicker();
    PickedFile? image = await picker.getImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        selectedImage = image;
        runModel();
      });
    }
  }

  runModel() async {
    if (selectedImage != null) {
      var predictions = await Tflite.runModelOnImage(
        path: selectedImage!.path,
        imageMean: 127.5,
        imageStd: 127.5,
        numResults: 2,
        threshold: 0.1,
        asynch: true,
      );
      predictions!.forEach((element) {
        setState(() {
          output = element['label'];
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: selectImage,
              child: DottedBorder(
                dashPattern: [14, 10],
                strokeWidth: 2,
                color: Colors.blue,
                strokeCap: StrokeCap.round,
                borderType: BorderType.RRect,
                radius: Radius.circular(5),
                child: Container(
                  height: 250,
                  width: 250,
                  child: selectedImage != null
                      ? Image.file(
                          File(selectedImage!.path),
                          height: 200,
                          width: double.infinity,
                        )
                      : Icon(
                          Icons.file_copy_outlined,
                        ),
                  color: Colors.white,
                ),
              ),
            ),
            text(
              data: output,
              color: Colors.black,
              size: 25,
              Bold: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
