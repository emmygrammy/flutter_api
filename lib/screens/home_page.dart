import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_api/model/user.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter api'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fectchUsers,
        child: Icon(Icons.person_add_alt_1),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          final email = user.email;
          // final color = user.gender =='male'? Colors.blue:Colors.green;
          return ListTile(
            leading: Icon(Icons.person),
            trailing: Icon(Icons.arrow_forward),
              title: Text('${user.name.title} ${user.name.first} ${user.name.last}'),
              subtitle: Text(email),
              // tileColor: (color),
          );
        },
      ),
    );
  }
  void fectchUsers() async{
    print('fetchUsers');
    const uri = 'https://randomuser.me/api/?results=100';
    final response = await http.get(Uri.parse(uri));
    print(response.body);
    final json = jsonDecode(response.body);
    print(json);
    final results = json['results'] as List<dynamic>;
    final transformed = results .map((e){
      return User(
        gender: e['gender'],
        email: e['email'],
        phone: e['phone'],
        cell: e['cell'],
        nat: e['nat'],
        name: UserName(
          title: e['name']['title'],
          first: e['name']['first'],
          last: e['name']['last'],
        ),
      );
    }).toList();
    setState(() {
      users = transformed;
    });
    print("fetch users completed");
  }
}