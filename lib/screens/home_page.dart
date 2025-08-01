import 'package:flutter/material.dart';
import 'package:flutter_api/model/user.dart';
import 'package:flutter_api/services/user_api.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fectchUsers();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter api'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
     
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          final email = user.email;
          final fullName = user.name.fullName;
          // final color = user.gender =='male'? Colors.blue:Colors.green;
          return ListTile(
            leading: Icon(Icons.person),
            trailing: Icon(Icons.arrow_forward),
              title: Text(fullName),
              subtitle: Text(email),
              // tileColor: (color),
          );
        },
      ),
    );
  }
  Future<void> fectchUsers() async{
    final response = await UserApi.fectchUsers();
    setState(() {
      users = response;
    });
  }
  
}