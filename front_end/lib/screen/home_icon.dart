import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  String image;
  String text;
  Color color;

  Category({required this.image, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 180,
        width: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Color(0xFF4A90E2),
        ),
        child: Column(
          children: [
            Image.asset(
              image,
              width: 80,
              height: 80,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              text,
              style: TextStyle(color: color, fontSize: 18),
            ),
          ],
        ),
      ),
      onTap: () {},
    );
  }
}