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
        onPressed: (){},
        child: Text(titleButton),
      ),
    );
  }
}
