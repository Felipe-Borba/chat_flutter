import 'package:chat_flutter/components/custom_button.dart';
import 'package:chat_flutter/components/custom_input.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(12),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.message, size:150),
            const Text("Cadastro", style: TextStyle(fontSize: 24)),
            CustomInput(labelText: "Nome"),
            CustomInput(labelText: "Telefone"),
            CustomInput(labelText: "Email"),
            CustomInput(labelText: "Senha", obscure: true),
            CustomInput(labelText: "Repita sua senha", obscure: true),
            CustomButton(titleButton: "Cadastrar")
          ],
        ),
      ),
    );
  }
}
