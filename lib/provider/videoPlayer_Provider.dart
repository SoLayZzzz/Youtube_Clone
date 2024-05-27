import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_clone/view/videoPlay.dart';

class VideoPlayerWithControls extends StatefulWidget {
  final VideoPlayerController videoPlayerController;

  VideoPlayerWithControls({required this.videoPlayerController});

  @override
  _VideoPlayerWithControlsState createState() =>
      _VideoPlayerWithControlsState();
}

class _VideoPlayerWithControlsState extends State<VideoPlayerWithControls> {
  bool _isPlaying = false;
  bool _showControls = true;
  Timer? _hideControlsTimer;

  @override
  void dispose() {
    _hideControlsTimer?.cancel();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      if (_isPlaying) {
        widget.videoPlayerController.pause();
      } else {
        widget.videoPlayerController.play();
      }
      _isPlaying = !_isPlaying;
    });
    _resetHideControlsTimer();
  }

  void _showControlsTemporarily() {
    setState(() {
      _showControls = true;
    });
    _resetHideControlsTimer();
  }

  void _resetHideControlsTimer() {
    _hideControlsTimer?.cancel();
    _hideControlsTimer = Timer(const Duration(seconds: 1), () {
      setState(() {
        _showControls = false;
      });
    });
  }

  void _back() async {
    final currentPosition = await widget.videoPlayerController.position;
    final newPosition = currentPosition! - const Duration(seconds: 10);
    widget.videoPlayerController.seekTo(newPosition);
    _showControlsTemporarily();
  }

  void _skip() async {
    final currentPosition = await widget.videoPlayerController.position;
    final newPosition = currentPosition! + const Duration(seconds: 10);
    widget.videoPlayerController.seekTo(newPosition);
    _showControlsTemporarily();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showControlsTemporarily,
      child: Stack(
        alignment: Alignment.center,
        children: [
          VideoPlayEdit(videoPlayerController: widget.videoPlayerController),
          Visibility(
            visible: _showControls,
            child: IconButton(
              onPressed: _togglePlayPause,
              icon: Icon(
                _isPlaying ? Icons.pause : Icons.play_arrow,
                size: 64.0,
                color: Colors.white,
              ),
            ),
          ),
          Visibility(
            visible: _showControls,
            child: Positioned(
              left: 20.0,
              child: IconButton(
                icon: const Icon(Icons.replay_10,
                    color: Colors.white, size: 32.0),
                onPressed: _back,
              ),
            ),
          ),
          Visibility(
            visible: _showControls,
            child: Positioned(
              right: 20.0,
              child: IconButton(
                icon: const Icon(Icons.forward_10,
                    color: Colors.white, size: 32.0),
                onPressed: _skip,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
