import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  String labelText;
  bool obscure;

  CustomInput({
    super.key,
    required this.labelText,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        obscureText: obscure,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: labelText,
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
