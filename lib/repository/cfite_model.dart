import 'dart:convert';

class Cfite {
  String firstName = '';
  String lastName = '';
  String uid = '';
  String displayName = '';
  String faculty = '';
  String department = '';
  String address = '';
  String cell = '';
  String unit = '';
  String isAlumni = '';
  String preferName ='';
  String phoneNumber = '';
  String? country;
  String? state;
  String? city;

  Cfite({
    required this.firstName,
    required this.lastName,
    required this.uid,
    required this.displayName,
    required this.faculty,
    required this.department,
    required this.address,
    required this.cell,
    required this.unit,
    required this.isAlumni,
    required this.phoneNumber,
    this.country,
    this.state,
    this.city,
  });


  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'uid': uid,
      'displayName': displayName,
      'faculty': faculty,
      'department': department,
      'address': address,
      'cell': cell,
      'unit': unit,
      'isAlumni': isAlumni,
      'phoneNumber': phoneNumber,
      'country': country,
      'state': state,
      'city': city,
    };
  }

  factory Cfite.fromMap(Map<String, dynamic> map) {
    return Cfite(
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      uid: map['uid'] ?? '',
      displayName: map['displayName'] ?? '',
      faculty: map['faculty'] ?? '',
      department: map['department'] ?? '',
      address: map['address'] ?? '',
      cell: map['cell'] ?? '',
      unit: map['unit'] ?? '',
      isAlumni: map['isAlumni'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      country: map['country'],
      state: map['state'],
      city: map['city'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Cfite.fromJson(String source) => Cfite.fromMap(json.decode(source));

}
