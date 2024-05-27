import 'package:flutter/material.dart';

class DrawerStateInfo with ChangeNotifier {
  int _currentDrawer = 0;

  // void setCurrentDrawer(int drawer) {
  //   _currentDrawer = drawer;
  //   notifyListeners();
  // }
  bool _isDrawerOpen = false;

  bool get isDrawerOpen => _isDrawerOpen;

  void toggleDrawer() {
    _isDrawerOpen = !_isDrawerOpen;
    notifyListeners();
  }

  void increment() {
    notifyListeners();
  }
}
