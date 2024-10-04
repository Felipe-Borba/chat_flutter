import 'package:chat_flutter/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String titleButton;

  CustomButton({
    super.key,
    required this.titleButton,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          try {
            await FirebaseAuthService().login();
            Navigator.pushReplacementNamed(context, "/");
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Usuario ou senha incorretos"),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: Text(titleButton),
      ),
    );
  }
}
