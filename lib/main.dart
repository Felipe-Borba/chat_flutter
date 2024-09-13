import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'views/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        fontFamily: GoogleFonts.raleway().fontFamily,
      ),
      home: const HomePage(),
    );
  }
}
