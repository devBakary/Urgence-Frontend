import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayers extends StatefulWidget {
  const YoutubePlayers({Key? key}) : super(key: key);

  @override
  State<YoutubePlayers> createState() => _YoutubePlayersState();
}

class _YoutubePlayersState extends State<YoutubePlayers> {
    final videoURL = "https://www.youtube.com/watch?v=helEv0kGHd4&list=RDla63LVk5ZWU&index=26";

    late YoutubePlayerController _controller;

    @override
    void initState() {
      super.initState();
      final videoID = YoutubePlayer.convertUrlToId(videoURL);
      _controller = YoutubePlayerController(initialVideoId: videoID!,
            flags: YoutubePlayerFlags(
              autoPlay: false,
            )
      );
    }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        YoutubePlayer(controller: _controller,
              showVideoProgressIndicator: true,
        ),
      ],
    );
  }
}
