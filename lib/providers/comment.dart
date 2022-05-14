import 'package:cfi_nexus/repository/post.dart';

import 'package:flutter/material.dart';

class Comments extends ChangeNotifier {
  Post? _post;
  Post? get post => _post;

  void getPost(Post post) {
    _post = post;

    notifyListeners();
  }
}
