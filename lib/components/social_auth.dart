import 'package:flutter/material.dart';

class SocialAuth extends StatelessWidget {
  const SocialAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          colors: [
            Colors.blueAccent,
            Colors.lightBlue,
          ],
          begin: Alignment.topCenter,
        ),
      ),
      child: Image.network(
        "https://cdn-icons-png.flaticon.com/512/59/59439.png",
        color: Colors.white,
      ),
    );
  }
}
