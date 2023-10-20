
// import 'package:flutter/material.dart';
// import 'package:flutter_tflite/flutter_tflite.dart';
// import 'package:image_picker/image_picker.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   String output = "";

//   captureImage() async {
//     try {
//       final imagePicker = ImagePicker();
//       final XFile? imageFile =
//           await imagePicker.pickImage(source: ImageSource.gallery);
//       if (imageFile != null) {
//         runModel(imageFile.path);
//       }
//     } catch (e) {
//       print("Error selecting image: $e");
//     }
//   }

//   runModel(String imagePath) async {
//     var predictions = await Tflite.runModelOnImage(
//       path: imagePath,
//       imageMean: 127.5,
//       imageStd: 127.5,
//       numResults: 2,
//       threshold: 0.1,
//       asynch: true,
//     );
//     setState(() {
//       output = predictions![0]['label'];
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.deepPurple,
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.all(20),
//             child: Container(
//               height: 200, // Set the desired image height
//               width: 200, // Set the desired image width
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage(
//                       "assets/placeholder_image.png"), // You can use a placeholder image here
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ),
//           ElevatedButton(
//             onPressed: captureImage,
//             child: Text("Select Image from Gallery"),
//           ),
//           Text(
//             output,
//             style: TextStyle(
//                 color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
//           )
//         ],
//       ),
//     );
//   }
// }
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tf/main.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:tflite_flutter/tflite_flutter_platform_interface.dart';
import 'package:flutter_tflite/flutter_tflite.dart';

class LiveStream extends StatefulWidget {
  const LiveStream({super.key});

  @override
  State<LiveStream> createState() => _LiveStreamState();
}

class _LiveStreamState extends State<LiveStream> {
  CameraImage? cameraImage;
  CameraController? cameraController;
  String output = "";

  @override
  void initState() {
    super.initState();
    loadCamera();
    loadModel();
  }

  loadCamera() {
    cameraController = CameraController(cameras![0], ResolutionPreset.medium);
    cameraController!.initialize().then((value) {
      if (!mounted) {
        return;
      } else {
        setState(() {
          cameraController!.startImageStream((imageStream) {
            cameraImage = imageStream;
            runModel();
          });
        });
      }
    });
  }

  runModel() async {
    if (cameraImage != null) {
      var predictions = await Tflite.runModelOnFrame(
        bytesList: cameraImage!.planes.map((plane) {
          return plane.bytes;
        }).toList(),
        imageHeight: cameraImage!.height,
        imageWidth: cameraImage!.width,
        imageMean: 127.5,
        imageStd: 127.5,
        rotation: 90,
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

  loadModel() async {
    await Tflite.loadModel(
        model: "assets/fyp1.tflite", labels: "assets/labels.txt");
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
            child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width,
                child: !cameraController!.value.isInitialized
                    ? Container()
                    : AspectRatio(
                        aspectRatio: cameraController!.value.aspectRatio,
                        child: CameraPreview(cameraController!),
                      )),
          ),
          Text(
            output,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          )
        ],
      ),
    );
  }
}
