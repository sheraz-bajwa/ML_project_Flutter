import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:tf/Camera.dart';
import 'package:tf/GalleryPick.dart';
import 'package:tf/LiveStream.dart';

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
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue, // Set the background color here
              ),
              child: Center(
                child: DropdownButton(
                  isDense: true, // Reduce vertical padding
                  //isExpanded: true, // Make the dropdown button wide
                  icon: Icon(Icons.arrow_drop_down), // Add an arrow icon
                  iconSize: 24.0, // Icon size
                  underline: Container(
                    // Remove the underline
                    height: 0,
                  ),
                  hint: Text("Camera"),
                  key: _dropdownKey1,
                  items: [
                    DropdownMenuItem(
                      value: 'Option 1',
                      child: Text('Live Stream'),
                    ),
                    DropdownMenuItem(
                      value: 'Option 2',
                      child: Text('Picture'),
                    ),
                  ],
                  onChanged: (value) {
                    // Handle the selected value here
                    if (value == 'Option 1') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LiveStream()));
                    } else if (value == 'Option 2') {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Camera()));
                    }
                  },
                ),
              ),
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Gallery()));
                      },
                      icon: Icon(Icons.file_copy_outlined)),
                  color: Colors.white,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                openDropDown(_dropdownKey1); // Open the first Dropdown
              },
              child: Text(' LiveStream '),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     openDropDown(_dropdownKey2); // Open the second Dropdown
            //   },
            //   child: Text('Use camera for pic'),
            // )
          ],
        ),
      ),
    );
  }
}
