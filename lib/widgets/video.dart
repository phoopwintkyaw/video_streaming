// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class VideoApp extends StatefulWidget {
//   final String videoUrl;
//   const VideoApp({
//     super.key,
//     required this.videoUrl,
//   });

//   @override
//   State<VideoApp> createState() => _VideoAppState();
// }

// class _VideoAppState extends State<VideoApp> {
//   late VideoPlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.networkUrl(
//       Uri.parse(widget.videoUrl),
//     )..initialize().then((_) {
//         setState(() {});
//       });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: _controller.value.isInitialized
//           ? GestureDetector(
//               onTap: () {
//                 _controller.value.isPlaying
//                     ? _controller.pause()
//                     : _controller.play();
//               },
//               child: AspectRatio(
//                 aspectRatio: 16 / 9,
//                 child: VideoPlayer(_controller),
//               ),
//             )
//           : AspectRatio(
//               aspectRatio: 16 / 9,
//               child: Container(
//                 color: Colors.grey,
//                 child: const Center(
//                   child: CircularProgressIndicator.adaptive(),
//                 ),
//               ),
//             ),
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }
// }

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerScreen({Key? key, required this.videoUrl}) : super(key: key);

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    _chewieController = ChewieController(
      materialProgressColors: ChewieProgressColors(
        handleColor: const Color(0xff0958d9),
        backgroundColor: Colors.black,
        playedColor: const Color(0xfff1ae56),
      ),
      videoPlayerController: _videoPlayerController,
      aspectRatio: 16 / 9,
      autoInitialize: true,
      looping: false,
      allowFullScreen: true,
      allowMuting: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Chewie(
        controller: _chewieController,
      ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }
}
