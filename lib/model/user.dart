import 'package:flutter_api/model/dob.dart';
import 'package:flutter_api/model/user_location.dart';
import 'package:flutter_api/model/user_name.dart';
import 'package:flutter_api/model/user_picture.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final FullName name;
  final UsersDob dob;
  final UserLocation location;
  final UserPicture picture;

 
  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.name,
    required this.dob,
    required this.location,
    required this.picture,
    });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      gender: json['gender'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      cell: json['cell'] ?? '',
      nat: json['nat'] ?? '',
      name: FullName.fromJson(json['name'] ?? {}),
      dob: UsersDob.fromJson(json['dob'] ?? {}),
      location: UserLocation.fromJson(json['location'] ?? {}),
      picture: UserPicture.fromJson(json['picture'] ?? {}),
    );
  }
}


