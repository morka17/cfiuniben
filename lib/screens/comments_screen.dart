import 'package:cfi_nexus/views/comments_view.dart';
import 'package:flutter/material.dart';

class CommentsScreen extends StatefulWidget {
  static const String id = "/comments";
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  _CommentsScreenState createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: 0.0,
        backgroundColor: Colors.white,
        title:const Text("Comments"),
      ),
      body: const CommentView(),
    );
  }
}
