import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class WelcomeView with ChangeNotifier {
  bool _signIn = false;

  String _firstName = '';
  String _lastName = '';
  String? _email = '';
  String _password = '';
  final String _uid = '';
  final String _displayName = '';
  late BuildContext _loadingContext;

  set firstName(value) => _firstName = value;
  set lastName(value) => _lastName = value;
  set email(value) => _email = value;
  set password(value) => _password = value;
  set loadingContext(value) => _loadingContext = value;

  bool get signIn => _signIn;

  BuildContext get loadingContext => _loadingContext;

  String get firstName => _firstName;
  String get lastName => _lastName;
  String get email => _email!;
  String get password => _password;
  String get uid => _uid;
  String get displayName => _displayName;

  void changeView(bool view) {
    _signIn = view;

    notifyListeners();
  }

  void googleSign(BuildContext context) async {}

  void fbaseSign(context) async {}
}
