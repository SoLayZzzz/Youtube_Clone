import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_clone/color/color.dart';

class VideoPlayEdit extends StatefulWidget {
  const VideoPlayEdit({super.key});

  @override
  State<VideoPlayEdit> createState() => _VideoPlayEditState();
}

class _VideoPlayEditState extends State<VideoPlayEdit> {
  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(
          'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'),
    );
    videoPlayerController.addListener(() {
      setState(() {});
    });

    videoPlayerController.setLooping(true);
    videoPlayerController.initialize().then((_) {
      setState(() {
        videoPlayerController.play();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: Column(
          children: [
            videoPlayerController.value.isInitialized
                ? AspectRatio(
                    aspectRatio: videoPlayerController.value.aspectRatio,
                    child: VideoPlayer(videoPlayerController))
                : const Text("Loading vieo..."),
          ],
        ),
      ),
    );
  }
}
