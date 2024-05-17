import 'package:flutter/material.dart';

class IconBottonEdit extends StatelessWidget {
  IconBottonEdit({super.key, required this.icon, required this.ontap});
  IconData icon;
  VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: ontap, icon: Icon(icon));
  }
}
