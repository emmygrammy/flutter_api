import 'dart:convert';

import 'package:flutter_api/model/user.dart';
import 'package:http/http.dart' as http;

class UserApi {
  static Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse('https://randomuser.me/api/?results=100'));
    print('API response: \${response.body}');
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> results = data['results'] ?? [];
      List<User> users = [];
      for (var item in results) {
        try {
          // Only map if all required fields are present
          if (item['name'] != null && item['picture'] != null && item['email'] != null) {
            users.add(User.fromJson(item));
          } else {
            print('Skipping user due to missing fields: \$item');
          }
        } catch (e) {
          print('Error parsing user: \$e, data: \$item');
        }
      }
      return users;
    } else {
      throw Exception('Failed to load users');
    }
  }
}