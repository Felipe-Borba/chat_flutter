import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  DetailPage({super.key, required this.user});

  Map user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user["firstName"]),
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text("Voltar"),
      )),
    );
  }
}
