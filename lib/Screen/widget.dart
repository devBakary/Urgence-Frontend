import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Testes extends StatefulWidget {
  const Testes({Key? key}) : super(key: key);

  @override
  State<Testes> createState() => _TestesState();
}

class _TestesState extends State<Testes> {

  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset("assets/videos/Accueil.mp4");
    _videoPlayerController!.initialize().then((_) {
      _chewieController = ChewieController(videoPlayerController: _videoPlayerController!);
    setState(() {

       });
    });
  }

  @override
  void dispose() {
    _videoPlayerController!.dispose();
    _chewieController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: _chewieVideoPlayer());
  }

  Widget _chewieVideoPlayer(){
    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width * .90,
      child: Chewie(
        controller: _chewieController!,
      ),
    );
  }
}
