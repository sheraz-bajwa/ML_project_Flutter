import 'package:flutter/material.dart';

import 'Fonts.dart';

class Containerrr extends StatelessWidget {
  const Containerrr(
      {super.key,
      required this.imag,
      required this.Name,
      required this.color,
      this.fit, required this.onTap});

  final String imag;
  final String Name;
  final Color color;
  final fit;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap,
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  imag,
                  fit: fit,
                ),
              ),
            ),
            Expanded(
              child: text(
                color: Colors.white,
                data: Name,
                size: 30,
                Bold: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
