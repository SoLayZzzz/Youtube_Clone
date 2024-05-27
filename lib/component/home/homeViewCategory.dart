import 'package:flutter/material.dart';
import 'package:youtube_clone/color/color.dart';

class HomeViewCate extends StatelessWidget {
  HomeViewCate(
      {super.key, required this.icon, required this.text, required this.size});
  String text;
  IconData icon;
  double size;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
          color: grey.withOpacity(0.3),
          borderRadius: const BorderRadius.all(Radius.circular(25))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              text,
              style: TextStyle(fontSize: size),
            ),
          ],
        ),
      ),
    );
  }
}
