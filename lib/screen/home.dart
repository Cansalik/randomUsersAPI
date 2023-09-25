import 'package:flutter/material.dart';
import 'package:results_api/model/user.dart';
import 'package:results_api/services/user_api.dart';

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
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Center(child: Text("Random Users API", style: TextStyle(color: Colors.black),)),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index)
        {
          final user = users[index];
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(user.picture.thumbnail),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user.fullName,style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                        const SizedBox(height: 5,),
                        Row(
                          children: [
                            Text(user.email,style: const TextStyle(fontSize: 16,color: Colors.blue),),
                            const SizedBox(width: 10,),
                            Text(user.location.country,style: const TextStyle(fontSize: 12,color: Colors.deepOrange),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> getUsers() async
  {
    final response = await UserApi.getUsers();
    setState(() {
      users = response;
    });
  }
}
