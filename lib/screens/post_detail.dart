import 'package:flutter/material.dart';
import 'package:zayat/models/all_post.dart';
import 'package:zayat/widgets/video.dart';

class PostDetail extends StatefulWidget {
  const PostDetail({super.key});

  static const String route = '/postDetail';
  @override
  State<PostDetail> createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  @override
  Widget build(BuildContext context) {
    final post = ModalRoute.of(context)!.settings.arguments as Posts;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: VideoPlayerScreen(
            videoUrl: post.mediaLocation?.first ?? '',
          ),
        ),
      ),
    );
  }
}
