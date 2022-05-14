import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class BioView with ChangeNotifier {
  Widget? _view;
  int _index = 1;

  File? _image;
  File? get image => _image;

  String _faculty = '';
  String _department = '';
  String _address = '';
  String _cell = '';
  String _unit = '';
  String _isAlumni = '';
  String _preferName = '';
  String _phoneNumber = '';
  String _photoUrl = '';
  String? _country;
  String? _state;
  String? _city;

  set faculty(value) => _faculty = value;
  set department(value) => _department = value;
  set address(value) => _address = value;
  set cell(value) => _cell = value;
  set unit(value) => _unit = value;
  set isAlumni(value) => _isAlumni = value;
  set preferName(value) => _preferName = value;
  set phoneNumber(value) => _phoneNumber = value;
  set photoUrl(value) => _photoUrl = value;

  String get faculty => _faculty;
  String get department => _department;
  String get address => _address;
  String get cell => _cell;
  String get unit => _unit;
  String get isAlumni => _isAlumni;
  String get preferName => _preferName;
  String get phoneNumber => _phoneNumber;
  String get photoUrl => _photoUrl;
  String? get country => _country;
  String? get state => _state;
  String? get city => _city;

  Widget? get view => _view;
  int get index => _index;

  void changeView(Widget view, [index]) {
    _view = view;
    if (index != null) _index = index;
    notifyListeners();
  }

  void setCountry(String? country) {
    _country = country;
    notifyListeners();
  }

  void setState(String? state) {
    _state = state;
    notifyListeners();
  }

  void setCity(String? city) {
    _city = city;
    notifyListeners();
  }

  void pickImage(BuildContext context) async {
    await FilePicker.platform
        .pickFiles(
          type: FileType.image,
        )
        .then((value) => _image = File(value!.files.single.path!))
        .catchError((e) {
      //print("Error get image from device, because $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Process terminated, unable to complete.')),
      );
    });

    notifyListeners();
  }

  void uploadPhoto(context) async {
    // CService _cservice = CService();
    // if (_image != null)
    // _photoUrl =  await _cservice.uploadImage(_image!.path, context);
  }

  void createUserProfile(BuildContext context) async {
    // Cfite cfite = Cfite(
    //   firstName: context.watch<WelcomeView>().firstName,
    //   lastName: context.watch<WelcomeView>().lastName ,
    //   uid: context.watch<WelcomeView>().uid ,
    //   displayName: context.watch<WelcomeView>().displayName,
    //   faculty: _faculty,
    //   department: _department,
    //   address: _address,
    //   cell: _cell,
    //   unit: _unit,
    //   isAlumni: _isAlumni,
    //   phoneNumber: _phoneNumber,
    // );

    // final collection = FirebaseFirestore.instance.collection("Cfites");

    // await collection.add(cfite.toMap()).then((value) {
    //   Navigator.pushNamed(context, HomeScreen.id);
    // }).catchError((e) {
    //   showOkAlertDialog(
    //     context: context,
    //     title: "Error",
    //     message: "unable to create Profile",
    //     useActionSheetForCupertino: true,
    //   );
    // });
  }
}
