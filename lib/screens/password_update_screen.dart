import 'package:cfi_nexus/views/update_password.dart';
import 'package:flutter/material.dart';

class PasswordUpdateScreen extends StatelessWidget {
  static const String id = "/update_password";
  const PasswordUpdateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update password"),
      ),
      body:  const UpdatePassword(),
    );
  }
}
