import 'package:cfi_nexus/views/image_view.dart';
import 'package:flutter/material.dart';

class ImageScreen extends StatefulWidget {
  static const String id = "/image";
  const ImageScreen({Key? key}) : super(key: key);

  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white.withAlpha(8),
        actions: [
          SizedBox(
            height: 40.0,
            child: PopupMenuButton(
              // padding: const EdgeInsets.only(top: 0, bottom: 0, right: 0),
              icon: const Icon(
                Icons.more_vert,
              ),
              itemBuilder: (context) {
                return <PopupMenuEntry<int>>[
                  PopupMenuItem(
                    value: 0,
                    child: Row(
                      children: const [
                        Icon(Icons.save, color: Colors.black54),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Save")
                      ],
                    ),
                  ),
                ];
              },
              onSelected: (index) {
                // todo:
              },
            ),
          ),
        ],
      ),
      body: const ImageView(),
    );
  }
}
