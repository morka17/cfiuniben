import 'package:cfi_nexus/views/profile_view.dart';
import 'package:flutter/material.dart';


class ProfileScreen extends StatelessWidget {
  static const String id = "/profile";
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(onPressed: ()=> Navigator.pop(context), icon: const Icon(Icons.close))
        ],
      ),
      body: const ProfileView(),
    );
  }
}
