import 'package:flutter/material.dart';
import 'package:flutter_api/model/user.dart';
import 'package:flutter_api/services/user_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    print('HomePage initState called');
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      final response = await UserApi.fetchUsers();
      setState(() {
        users = response;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error fetching users: \$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter API'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: isLoading
        ? const Center(child: CircularProgressIndicator(
          color: Colors.blue,
        ))
        : users.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  final fullName = user.name.fullName;
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(user.picture.medium),
                          onBackgroundImageError: (_, __) =>
                              const Icon(Icons.error),
                        ),
                        trailing: Text(user.location.country),
                        title: Text(fullName),
                        subtitle: Text(user.email),
                      ),
                      const Divider(
                        height: 0,
                        color: Colors.grey,
                        thickness: 0.5,

                      ),
                    ],
                  );
                
                },
               
              ),
      );
  }
}
