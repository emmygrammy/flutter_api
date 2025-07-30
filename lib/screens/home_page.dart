import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter api'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fectchUsers,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          final email = user['email'];
          final name = user['name']['first'];
          final imageUrl = user['picture']['thumbnail'];
          return ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: CircleAvatar(
                child: Image.network(imageUrl),
                ),
            ),
              title: Text(name),
            subtitle: Text(email),
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
    setState(() {
      users = json['results'];
    });
    print("fetch users completed");
  }
}