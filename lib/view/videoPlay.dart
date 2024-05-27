import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_clone/color/color.dart';

class VideoPlayEdit extends StatefulWidget {
  const VideoPlayEdit({super.key, required this.videoPlayerController});

  final VideoPlayerController videoPlayerController;

  @override
  State<VideoPlayEdit> createState() => _VideoPlayEditState();
}

class _VideoPlayEditState extends State<VideoPlayEdit> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: noColor,
        body: Column(
          children: [
            widget.videoPlayerController.value.isInitialized
                ? AspectRatio(
                    aspectRatio: widget.videoPlayerController.value.aspectRatio,
                    child: VideoPlayer(widget.videoPlayerController),
                  )
                : Column(
                    children: [
                      Center(
                        child: Container(
                          color: black,
                          width: double.infinity,
                          height: 250,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(
                                color: white,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Loading video....",
                                style: TextStyle(color: white),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
