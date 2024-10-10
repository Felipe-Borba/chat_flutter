import 'package:chat_flutter/firebase_options.dart';
import 'package:chat_flutter/views/feedback_page.dart';
import 'package:chat_flutter/views/home_page.dart';
import 'package:chat_flutter/views/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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
        fontFamily: GoogleFonts.adamina().fontFamily,
      ),
      // home: const FeedbackPage()
      initialRoute: "/login",
      routes: {
        "/": (_) => HomePage(),
        "/login": (_) => LoginPage(),
        "/feedback": (_) => FeedbackPage()
      },
    );
  }
}
