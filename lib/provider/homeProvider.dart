import 'package:flutter/material.dart';
import 'package:youtube_clone/category/homeCategory.dart';
import 'package:youtube_clone/repository/homeRepository.dart';

class HomeProvider extends ChangeNotifier {
  final HomeRepository homeRepository;

  HomeProvider({required this.homeRepository});

  var homecate = <HomeCategory>[];
  final data = <DataYouTube>[];

  List<DataYouTube> alldata = [];

  void onInit() {
    homecate = homeRepository.getDataYTCate();
  }

  void filterByIndex(int idx) {
    final cate = homecate[idx];
    final tmp = alldata.where((e) => e.category == cate.title).toList();
    data.addAll(tmp);
    notifyListeners();
  }
}
