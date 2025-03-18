import 'package:flutter/material.dart';
import 'pages/signup.dart';
import 'pages/homepage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      // home: const SignUpPage(),
    );
  }
}
