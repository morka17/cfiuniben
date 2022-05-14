import 'package:cfi_nexus/views/about_us.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatefulWidget {
  static const String id = "about_us";
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("About Us"),
      ),
      body: const AboutUs(),
    );
  }
}
