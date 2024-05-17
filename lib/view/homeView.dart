import 'package:flutter/material.dart';
import 'package:youtube_clone/category/homeCategory.dart';
import 'package:youtube_clone/color/color.dart';
import 'package:youtube_clone/view/videoPlay.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.datayt});

  final List<DataYouTube> datayt;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // itemCount: datayt.length,
        itemCount: 3,
        itemBuilder: (context, index) {
          // final data = datayt[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                InkWell(
                  onTap: () => showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: white,
                      context: context,
                      builder: (context) {
                        return FractionallySizedBox(
                            heightFactor: 1,
                            child: Column(
                              children: [
                                Container(
                                  height: 300,
                                  width: double.infinity,
                                  color: white,
                                  child: const VideoPlayEdit(),
                                )
                              ],
                            ));
                      }),
                  child: Container(
                    height: 210,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/forest.jpg"),
                            fit: BoxFit.cover)),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                // ignore: prefer_const_constructors
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage("assets/images/lay.jpg"),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title
                          const Text(
                            "Flutter Developper",
                            style: TextStyle(fontSize: 17),
                          ),
                          // Subtitle
                          Text(
                            "Krem Soklay . 10M views . 2 months",
                            style: TextStyle(color: black.withOpacity(0.7)),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
