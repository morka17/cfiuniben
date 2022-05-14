import 'package:cfi_nexus/screens/home_screen.dart';
import 'package:cfi_nexus/views/create_post.dart';
import 'package:cfi_nexus/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreatePostScreen extends StatelessWidget {
  static const String id = "/create";
  const CreatePostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Create post"),
        actions: [
          IconButton(
            onPressed: () async {
              progressLoading(context);
              await Future.delayed(const Duration(seconds: 3));
              Get.back();
              Navigator.pushNamed(context, HomeScreen.id);
            },
            icon: const Icon(
              Icons.send,
              size: 30.0,
            ),
            color: Colors.blue,
          ),
        ],
      ),
      body: const CreatePostView(),
    );
  }
}
