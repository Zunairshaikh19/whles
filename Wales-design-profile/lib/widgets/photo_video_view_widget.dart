// import 'package:flutter/material.dart';

// class PhotoVideoViewWidget extends StatelessWidget {
//   final String type;
//   final String url;

//   const PhotoVideoViewWidget({Key? key, required this.type, required this.url})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return type == "video"
//         ? VideoViewWidget(
//             videoUrl: url,
//           )
//         : PhotoViewWidget(
//             imageUrl: url,
//           );
//   }
// }

// class PhotoViewWidget extends StatelessWidget {
//   final String imageUrl;

//   const PhotoViewWidget({Key? key, required this.imageUrl}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return PhotoViewer(imageUrl);
//   }
// }

// class VideoViewWidget extends StatelessWidget {
//   final String videoUrl;

//   const VideoViewWidget({Key? key, required this.videoUrl}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Video(videoUrl);
//   }
// }