import 'package:cfi_nexus/views/settings_view.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
   static const String id = "/settings";
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: const SettingsView(),
    );
  }
}
