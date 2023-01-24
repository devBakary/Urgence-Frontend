import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  double _volume = 1.0;
  double _playbackSpeed = 1.0;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/Accueil.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: _controller.value.aspectRatio,

              child: VideoPlayer(_controller),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  VideoProgressIndicator(
                    _controller,
                    allowScrubbing: true,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: IconButton(
                          icon: const Icon(Icons.volume_down),
                          onPressed: () {
                            setState(() {
                              _volume -= 0.1;
                              _controller.setVolume(_volume);
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          icon: const Icon(Icons.volume_up),
                          onPressed: () {
                            setState(() {
                              _volume += 0.1;
                              _controller.setVolume(_volume);
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child:  FloatingActionButton(
                          backgroundColor: null,
                          onPressed: () {

                              setState(() {
                                _controller.value.isPlaying
                                ? _controller.pause()
                                    : _controller.play();
                              });
                          },
                          child: Icon(
                          _controller.value.isPlaying ? CupertinoIcons.pause_circle : CupertinoIcons.play,
                            ),
                          ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}





