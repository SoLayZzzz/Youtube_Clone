import 'package:flutter/material.dart';

class HomeCategory {
  String title;
  Icon? icon;

  HomeCategory({required this.title, this.icon = null});
  static List<HomeCategory> getHomeCate() => [
        //
        HomeCategory(
            title: "Icon",
            icon: const Icon(
              Icons.abc,
              size: 30,
            )),
        HomeCategory(title: "All"),
        HomeCategory(title: "Music"),
        HomeCategory(title: "Mixes"),
        HomeCategory(title: "Original"),
        HomeCategory(title: "Club"),
        HomeCategory(title: "Club"),

        //
      ];
}

class DataYouTube {
  String? name, subtitle, image, category;

  DataYouTube({this.image, this.category, this.name, this.subtitle});

  Map<String, dynamic> toMap() => {
        'name': name,
        'subtitle': subtitle,
        'image': image,
        'category': category
      };

  factory DataYouTube.fromJson(Map<String, dynamic> json) {
    return DataYouTube(
        name: json['name'],
        subtitle: json['subtitle'],
        image: json['image'],
        category: json['category']);
  }

  static List<DataYouTube> dataYT = [
    //
    DataYouTube(
        name: "Hello",
        subtitle: "hjhjkhjhkjhh",
        image: "assets/images/youtube.jpg",
        category: "All"),

    // Music
    DataYouTube(
        name: "Bye",
        subtitle: "hjhjkhjhkjhh",
        image: "assets/images/youtube.jpg",
        category: "Music")
    //
  ];
}
