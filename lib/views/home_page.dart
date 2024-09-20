// import 'package:chat_flutter/data/users_data.dart';
import 'package:chat_flutter/services/get_users.dart';
import 'package:chat_flutter/views/detail_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        title: const Text("HomePage"),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(5, (index) {
                return Container(
                  margin: const EdgeInsets.all(8),
                  child: const CircleAvatar(
                    radius: 45,
                  ),
                );
              }),
            ),
          ),
          Expanded(
              child: FutureBuilder(
            future: getUsers(),
            builder: (context, AsyncSnapshot snapshot) {
              var users = snapshot.data;
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return GridView.builder(
                  itemCount: users?.length ?? 0,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.85,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailPage(user: users[index]),
                          ),
                        );
                      },
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CircleAvatar(
                              radius: 70,
                              backgroundImage:
                                  NetworkImage(users[index]['image']),
                            ),
                            Text(
                              users[index]["firstName"],
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(users[index]['company']['title']),
                          ],
                        ),
                      ),
                    );
                  });
            },
          ))
        ],
      ),
    );
  }
}
