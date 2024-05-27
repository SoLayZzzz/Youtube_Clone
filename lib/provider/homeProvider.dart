import 'package:flutter/material.dart';
import 'package:youtube_clone/category/homeCategory.dart';
import 'package:youtube_clone/repository/homeRepository.dart';

class HomeProvider extends ChangeNotifier {
  final HomeRepository homeRepository;

  HomeProvider({required this.homeRepository});

  var homecate = HomeCategory.getHomeCate();
  var data = <DataYouTube>[];

  List<DataYouTube> alldata = DataYouTube.dataYT;
  var triggerDrawer = true;

  void onInit() {
    filterByIndex(1);
    triggleAppDrawer();
  }

  void filterByIndex(int idx) {
    final cate = homecate[idx];
    final tmp = alldata.where((e) => e.category == cate.title).toList();
    data = tmp;
    notifyListeners();
  }

  void triggleAppDrawer() {
    debugPrint("trigger");
    triggerDrawer = true;
    notifyListeners();
  }
}
