import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
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
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: selectedImage != null
                ? Image.file(
                    File(selectedImage!.path),
                    height: 200,
                    width: 200,
                  )
                : Container(),
          ),
          ElevatedButton(
            onPressed: selectImage,
            child: Text("Select Image from Gallery"),
          ),
          Text(
            output,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}
