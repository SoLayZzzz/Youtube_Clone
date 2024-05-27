import 'package:flutter/material.dart';
import 'package:youtube_clone/navigation/add.dart';
import 'package:youtube_clone/navigation/home.dart';
import 'package:youtube_clone/navigation/profile.dart';
import 'package:youtube_clone/navigation/short.dart';
import 'package:youtube_clone/navigation/subscription.dart';

class NavigaProvider extends ChangeNotifier {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  int _selectIndex = 0;
  List<NavigaEdit> item = [
    NavigaEdit(label: "Home", icon: Icons.home, widget: const HomePage()),
    NavigaEdit(
        label: "Shorts", icon: Icons.person_2, widget: const ShortsScreen()),
    NavigaEdit(
        label: "",
        icon: Icons.add_circle_rounded,
        widget: const AddScreen(),
        size: 40.0),
    NavigaEdit(
      label: "Subscriptions",
      icon: Icons.subscriptions_outlined,
      widget: const SubcriptionScreen(),
    ),
    NavigaEdit(label: "You", icon: Icons.person_2, widget: const Profile()),
  ];

  int get selectIndex => _selectIndex;
  set selectIndex(int value) {
    _selectIndex = value;
    notifyListeners();
  }

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState?.closeDrawer();
  }
}

class NavigaEdit {
  Widget? widget;
  String? label;
  IconData? icon;
  double? size;
  NavigaEdit({this.widget, this.icon, this.label, this.size});
}
