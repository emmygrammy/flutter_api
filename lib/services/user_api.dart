import 'dart:convert';

import 'package:flutter_api/model/user.dart';
import 'package:flutter_api/model/user_name.dart';
import 'package:http/http.dart' as http;

class UserApi {
  static Future<List<User>> fectchUsers() async{
    print('fetchUsers');
    const uri = 'https://randomuser.me/api/?results=100';
    final response = await http.get(Uri.parse(uri));
    print(response.body);
    final json = jsonDecode(response.body);
    print(json);
    final results = json['results'] as List<dynamic>;
    final users = results .map((e){
      return User(
        gender: e['gender'],
        email: e['email'],
        phone: e['phone'],
        cell: e['cell'],
        nat: e['nat'],
        name: FullName(
          title: e['name']['title'],
          first: e['name']['first'],
          last: e['name']['last'],
        ),
      );
    }).toList();
    return users;
  }
}