import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SettingOP extends StatelessWidget {
  SettingOP({super.key, required this.ontap, required this.text});

  String text;
  VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: ontap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: SizedBox(
              width: double.infinity,
              height: 30,
              child: Text(
                text,
                style: const TextStyle(fontSize: 17),
              )),
        ));
  }
}
