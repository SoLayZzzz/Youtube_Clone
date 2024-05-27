import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_clone/category/homeCategory.dart';
import 'package:youtube_clone/color/color.dart';
import 'package:youtube_clone/component/home/homeViewCategory.dart';
import 'package:youtube_clone/component/text.dart';
import 'package:youtube_clone/list/list_data_homeview.dart';
import 'package:youtube_clone/provider/videoPlayer_Provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.datayt});

  final List<DataYouTube> datayt;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(
          'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'),
    );
  }

  Future<bool> started() async {
    await videoPlayerController.initialize();
    await videoPlayerController.play();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: widget.datayt.length,
          itemBuilder: (context, index) {
            final data = widget.datayt[index];
            return Column(
              children: [
                InkWell(
                  onTap: () => showModalBottomSheet(
                    barrierColor: grey.withOpacity(0.5),
                    isScrollControlled: true,
                    backgroundColor: noColor,
                    context: context,
                    builder: (context) {
                      return SafeArea(
                        child: Scaffold(
                          body: Container(
                            color: noColor,
                            child: Column(
                              children: [
                                FutureBuilder(
                                    future: started(),
                                    builder: (context, snapshot) {
                                      if (snapshot.data ?? false) {
                                        return AspectRatio(
                                          aspectRatio: videoPlayerController
                                              .value.aspectRatio,
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                if (videoPlayerController
                                                    .value.isPlaying) {
                                                  videoPlayerController.pause();
                                                } else {
                                                  videoPlayerController.play();
                                                }
                                              });
                                            },
                                            child: VideoPlayerWithControls(
                                              videoPlayerController:
                                                  videoPlayerController,
                                            ),
                                          ),
                                        );
                                      } else {
                                        return Container(
                                          height: 250,
                                          width: double.infinity,
                                          color: black,
                                          child: const Center(
                                            child: Text("Loading video..."),
                                          ),
                                        );
                                      }
                                    }),
                                Expanded(
                                  child: Container(
                                    color: black,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Container(
                                          height: double.infinity,
                                          width: double.infinity,
                                          decoration: const BoxDecoration(
                                              color: white,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(15),
                                                  topRight:
                                                      Radius.circular(15))),
                                          child: ListView(
                                            children: [
                                              _builtTopLayout(),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              _buildListData()
                                            ],
                                          )),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  child: Container(
                    height: 210,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(data.image ?? ""),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(data.pf ?? ""),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title
                          Text(
                            data.name.toString(),
                            style: const TextStyle(fontSize: 17),
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
            );
          }),
    );
  }

  Padding _builtTopLayout() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextEdit(color: black, size: 20, text: "Flutter Deverlopper"),
          Row(
            children: [
              TextEdit(
                  color: black.withOpacity(0.8),
                  size: 12,
                  text: "19,199 views 20h ago"),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "...more",
                    style: TextStyle(fontWeight: FontWeight.bold, color: black),
                  ))
            ],
          ),
          Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage("assets/images/lay.jpg"),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "Krem Soklay",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "10M",
                style: TextStyle(color: black.withOpacity(0.8)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: black,
                    ),
                    onPressed: () {},
                    child: TextEdit(color: white, size: 13, text: "Subscribe")),
              )
            ],
          ),
          _buildLikeAndUnLike(),
          _buildComment(),
        ],
      ),
    );
  }

  Widget _buildLikeAndUnLike() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Container(
              height: 30,
              decoration: BoxDecoration(
                  color: grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.thumb_up_alt_outlined,
                        size: 17,
                      )),
                  const Text(
                    "10.999K",
                    style: TextStyle(fontSize: 12),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    height: 20,
                    width: 2,
                    color: grey,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.thumb_down_outlined,
                        size: 17,
                      )),
                ],
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            HomeViewCate(
              icon: Icons.forward_outlined,
              text: "Share",
              size: 12,
            ),
            const SizedBox(
              width: 5,
            ),
            HomeViewCate(
              icon: Icons.forward_outlined,
              text: "remix",
              size: 12,
            ),
            const SizedBox(
              width: 5,
            ),
            HomeViewCate(
              icon: Icons.download_outlined,
              text: "Download",
              size: 12,
            ),
            const SizedBox(
              width: 5,
            ),
            HomeViewCate(
              icon: Icons.cut_outlined,
              text: "Clip",
              size: 12,
            ),
            const SizedBox(
              width: 5,
            ),
            HomeViewCate(
              icon: Icons.bookmark_border,
              text: "Save",
              size: 12,
            ),
            const SizedBox(
              width: 5,
            ),
            HomeViewCate(
              icon: Icons.flag_outlined,
              text: "Report",
              size: 12,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildComment() {
    return Container(
      height: 85,
      width: double.infinity,
      decoration: BoxDecoration(
          color: grey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  "Comments",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 10,
                ),
                // qty cmt
                Text(
                  "10",
                  style: TextStyle(color: black.withOpacity(0.5)),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: black,
                  radius: 15,
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 300,
                  decoration: BoxDecoration(
                      color: grey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15)),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("Add a comment..."),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildListData() {
    return ListHomeViewData();
  }
}
