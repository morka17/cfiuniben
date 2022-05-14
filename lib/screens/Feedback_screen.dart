import 'package:flutter/material.dart';

import 'package:cfi_nexus/views/feedback_view.dart';

class FeedbackScreen extends StatelessWidget {
  static const String id = "/feedback";
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
      title: const Text("Feedback"),
      ),
      body: const FeedbackView(),
    );
  }
}
