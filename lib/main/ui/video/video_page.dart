// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:video_player/video_player.dart';

// class VideoPage extends StatefulWidget {
//   const VideoPage({super.key});

//   @override
//   State<VideoPage> createState() => _VideoPageState();
// }

// class _VideoPageState extends State<VideoPage> {
//   late VideoPlayerController _controller;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _controller = VideoPlayerController.networkUrl(Uri.parse(
//         'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
//       ..initialize().then((value) {
//         setState(() {});
//       });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//           child: _controller.value.isInitialized
//               ? AspectRatio(
//                   aspectRatio: _controller.value.aspectRatio,
//                   child: VideoPlayer(_controller),
//                 )
//               : Container()),
//     );
//   }
// }
