import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:tf/Camera.dart';
import 'package:tf/Fonts.dart';
import 'package:tf/GalleryPick.dart';
import 'package:tf/LiveStream.dart';

class ContainerGrid extends StatelessWidget {
  final List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
  ];

  final List<IconData> icons = [
    Icons.ac_unit,
    Icons.access_alarm,
    Icons.access_time,
    Icons.account_balance,
    Icons.account_box,
    Icons.airport_shuttle,
  ];
  final List<double> containerWidths = [100, 150, 80, 120, 200, 100];
  final List<double> containerHeights = [150, 100, 120, 90, 150, 80];

  final List<void Function()> onTapFunctions = [
    () {
      // Function for the first container
      print('Tapped on the first container');
    },
    () {
      // Function for the second container
      print('Tapped on the second container');
    },
    () {
      // Function for the third container
      print('Tapped on the third container');
    },
    () {
      // Function for the fourth container
      print('Tapped on the fourth container');
    },
    () {
      // Function for the fifth container
      print('Tapped on the fifth container');
    },
    () {
      // Function for the sixth container
      print('Tapped on the sixth container');
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beautiful Grid View'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
        ),
        itemCount: 2,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: onTapFunctions[index],
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              curve: Curves.bounceInOut,
              width: containerWidths[index],
              height: containerHeights[index],
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colors[index],
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Center(
                child: Icon(
                  icons[index],
                  size: 64,
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  GlobalKey _dropdownKey1 = GlobalKey();

  void openDropDown(GlobalKey key) {
    final dynamic state = key.currentState;
    state.toggleDropdown();
  }

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
                        child: Text(
                          "Hollaa",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
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
                          Text(
                            'Lets Track Your Signs!! ',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
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
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Container(
                  //   height: 50,
                  //   width: 200,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(10),
                  //     color: Colors.blue, // Set the background color here
                  //   ),
                  //   child: Center(
                  //     child: DropdownButton(
                  //       isDense: true, // Reduce vertical padding
                  //       //isExpanded: true, // Make the dropdown button wide
                  //       icon: Icon(Icons.arrow_drop_down), // Add an arrow icon
                  //       iconSize: 24.0, // Icon size
                  //       underline: Container(
                  //         // Remove the underline
                  //         height: 0,
                  //       ),
                  //       hint: Text("Camera"),
                  //       key: _dropdownKey1,
                  //       items: [
                  //         DropdownMenuItem(
                  //           value: 'Option 1',
                  //           child: Text('Live Stream'),
                  //         ),
                  //         DropdownMenuItem(
                  //           value: 'Option 2',
                  //           child: Text('Picture'),
                  //         ),
                  //       ],
                  //       onChanged: (value) {
                  //         // Handle the selected value here
                  //         if (value == 'Option 1') {
                  //           Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                   builder: (context) => LiveStream()));
                  //         } else if (value == 'Option 2') {
                  //           Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                   builder: (context) => Camera()));
                  //         }
                  //       },
                  //     ),
                  //   ),
                  // ),
                  //ContainerGrid(),

                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Gallery()));
                    },
                    child: DottedBorder(
                      dashPattern: [14, 10],
                      strokeWidth: 2,
                      strokeCap: StrokeCap.round,
                      borderType: BorderType.RRect,
                      radius: Radius.circular(5),
                      child: Container(
                        height: 200,
                        width: 200,
                        child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Gallery()));
                            },
                            icon: Icon(Icons.file_copy_outlined)),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LiveStream()));
                            },
                            child: Expanded(
                                child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color.fromARGB(255, 7, 255, 40),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        'assets/photo.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  text(
                                    color: Colors.white,
                                    data: 'Live stream',
                                    size: 20,
                                  ),
                                ],
                              ),
                              height: 120,
                              width: 120,
                            )),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Camera()));
                            },
                            child: Expanded(
                                child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.amber,
                              ),
                              height: 120,
                              width: 120,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        'assets/live.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Drinks',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  )
                                ],
                              ),
                            )),
                          ),

                          // Container(color: Colors.amber,)
                        ]),
                  )
                ],
              ),

              // ContainerGrid(),
            ],
          ),
        ),
      ),
    );
  }
}
