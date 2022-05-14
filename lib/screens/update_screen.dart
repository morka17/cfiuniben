import 'package:cfi_nexus/providers/profile.dart';
import 'package:cfi_nexus/views/update_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateScreen extends StatelessWidget {
  static const String id = "/update";
  const UpdateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var d = context.watch<Updater>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Change ${d.title}"),
      ),
      body: const ProfileUpdateView(),
    );
  }
}
