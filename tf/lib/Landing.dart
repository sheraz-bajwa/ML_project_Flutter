import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  GlobalKey _dropdownKey = GlobalKey();

  void openDropDown() {
    final dynamic state = _dropdownKey.currentState;
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
            DropdownButtonHideUnderline(
              child: DropdownButton(
                key: _dropdownKey,
                items: [
                  DropdownMenuItem(
                    value: 'Option 1',
                    child: Text('Option 1'),
                  ),
                  DropdownMenuItem(
                    value: 'Option 2',
                    child: Text('Option 2'),
                  ),
                  DropdownMenuItem(
                    value: 'Option 3',
                    child: Text('Option 3'),
                  ),
                ],
                onChanged: (value) {
                  // Handle the selected value here
                },
              ),
            ),
            DropdownButton(
              key: _dropdownKey,
              items: [
                DropdownMenuItem(
                  value: 'Option 1',
                  child: Text('Option 1'),
                ),
                DropdownMenuItem(
                  value: 'Option 2',
                  child: Text('Option 2'),
                ),
                DropdownMenuItem(
                  value: 'Option 3',
                  child: Text('Option 3'),
                ),
              ],
              onChanged: (value) {
                // Handle the selected value here
              },
            ),
            GestureDetector(
              onTap: () {},
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
                      onPressed: () {}, icon: Icon(Icons.file_copy_outlined)),
                  color: Colors.white,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: openDropDown,
              child: Text(' LiveStream '),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Use camera for pic'),
            )
          ],
        ),
      ),
    );
  }
}
