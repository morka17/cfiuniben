import 'package:flutter/cupertino.dart';

class Updater extends ChangeNotifier {
  String _title = "username";
  String _value = "Joshuamorka";

  String get title => _title;
  String get value => _value;

  void getDetail(String title, value) {
    _title = title;
    _value = value;

    notifyListeners();
  }
}
