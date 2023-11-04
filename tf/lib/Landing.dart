import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:tf/BottomBar.dart';
import 'package:tf/Camera.dart';
import 'package:tf/Fonts.dart';
import 'package:tf/GalleryPick.dart';
import 'package:tf/LiveStream.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:animations/animations.dart';
import 'package:tf/mainContainer.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Color.fromARGB(255, 153, 22, 174),
                height: 80,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 168, 57, 186),
                            borderRadius: BorderRadius.circular(10)),
                        height: 50,
                        width: 50,
                        child: Center(
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 168, 57, 186),
                            borderRadius: BorderRadius.circular(10)),
                        height: 50,
                        width: 50,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 200,
                color: Color.fromARGB(255, 153, 22, 174),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: text(
                          color: Colors.white,
                          data: 'Hollaa',
                          size: 20,
                          Bold: FontWeight.bold,
                        ),
                        // Text(
                        //   "Hollaa",
                        //   style: TextStyle(fontSize: 15, color: Colors.white),
                        // ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 30,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          text(
                            color: Colors.white,
                            data: 'Lets Track Your Signs!! ',
                            size: 25,
                            Bold: FontWeight.bold,
                          ),
                          // Text(
                          //   'Lets Track Your Signs!! ',
                          //   style: TextStyle(fontSize: 20, color: Colors.white),
                          // ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                    decoration: InputDecoration(
                                  fillColor: Color.fromARGB(255, 168, 57, 186),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color:
                                            Color.fromARGB(255, 168, 57, 186)),
                                  ),
                                  filled: true,
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: Color.fromARGB(
                                              255, 168, 57, 186))),
                                  hintText: 'Search ',
                                  hintStyle: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255)),
                                )),
                              ),
                            ),
                          ),
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 168, 57, 186),
                                borderRadius: BorderRadius.circular(15)),
                            child: Icon(Icons.filter),
                          ),
                          SizedBox(
                              width:
                                  10), // Add some spacing between Text and TextFormField
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Containerrr(
                      Name: 'Live stream',
                      color: Color.fromARGB(255, 221, 87, 131),
                      imag: 'assets/live.png',
                      fit: BoxFit.cover,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LiveStream()));
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Containerrr(
                      Name: 'Camera',
                      color: Colors.amber,
                      imag: 'assets/photo.png',
                      fit: BoxFit.cover,
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Camera()));
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Containerrr(
                      Name: 'Gallery',
                      color: Color.fromARGB(255, 5, 106, 189),
                      imag: 'assets/picture.png',
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Gallery()));
                      },
                    ),
                  ]
                      .animate(interval: .200.seconds)
                      .fadeIn(duration: 1200.ms) // baseline=800ms
                      .slideX()
                      .then(delay: 200.ms)
                      .shimmer(duration: 1500.ms),
                ),
              ),

              // ContainerGrid(),
            ],
          ),
        ),
        bottomNavigationBar: MySta(),
      ),
    );
  }
}
