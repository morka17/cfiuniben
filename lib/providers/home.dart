import 'package:cfi_nexus/views/Posts_view.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

class HomeView extends ChangeNotifier {
  Widget _view = const PostsView();
  File? _image;
  int _viewIndex = 0;
  final List<Widget> _previousViews = [const PostsView()];

  Widget get view => _view;

  File? get image => _image;
  set image(value) => _image = value;

  void changeView(Widget view) {
    _previousViews.add(_view);
    _viewIndex = _previousViews.length;
    _view = view;
    notifyListeners();
  }

  void backView() {
    _view = !_viewIndex.isNegative
        ? _previousViews[_viewIndex--]
        : _previousViews[0];
    notifyListeners();
  }

  void pickImage(BuildContext context) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.image,
      );
      _image = File(result!.files.single.path!);
    } catch (e) {
      Get.snackbar('Failed', 'Process terminated, unable to complete');
    }

    notifyListeners();
  }
}
