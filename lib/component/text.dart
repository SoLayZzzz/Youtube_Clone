import 'package:flutter/material.dart';

class TextEdit extends StatelessWidget {
  TextEdit(
      {super.key, required this.color, required this.size, required this.text});

  String text;
  double size;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
      ),
    );
  }
}
