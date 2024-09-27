import 'package:chat_flutter/components/custom_button.dart';
import 'package:flutter/material.dart';

import '../components/custom_input.dart';
import '../components/social_auth.dart';
import 'register_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FlutterLogo(size: 150),
            CustomInput(labelText: "Email"),
            CustomInput(labelText: "Senha", obscure: true),
            CustomButton(titleButton: "Entrar"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Ainda não tem um conta?"),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RegisterPage()),
                    );
                  },
                  child: const Text("Cadastre-se"),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialAuth(),
                SocialAuth(),
                SocialAuth(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
