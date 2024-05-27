import 'package:flutter/material.dart';
import 'package:youtube_clone/color/color.dart';

class ProfileCate extends StatelessWidget {
  ProfileCate({super.key, required this.icon, required this.text});
  String text;
  IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
          color: grey.withOpacity(0.5),
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
              style: const TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
