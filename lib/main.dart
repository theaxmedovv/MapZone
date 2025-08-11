import 'package:flutter/material.dart';
import 'package:my_app/pages/anding_page1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFB0FF00), // Neon green
        fontFamily: 'Arial',
      ),
      home: const LandingPage1(),
    );
  }
}
