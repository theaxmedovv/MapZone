import 'package:flutter/material.dart';
import 'landing_page2.dart';

class LandingPage1 extends StatelessWidget {
  const LandingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const LandingPage2(),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
          transitionDuration: const Duration(milliseconds: 800),
        ),
      );
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Modern logo with gradient and shadow
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.blueAccent, Colors.lightBlue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.3),
                    blurRadius: 20,
                    spreadRadius: 5,
                  )
                ],
              ),
              child: const Icon(
                Icons.map_rounded,
                size: 80,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            // Modern text with gradient
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [Colors.blueAccent, Colors.lightBlue],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ).createShader(bounds),
              child: const Text(
                "MapZone",
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Color is overridden by shader
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Subtitle
            const Text(
              "Navigate your world",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                letterSpacing: 1.2,
              ),
            ),
            // Loading indicator at the bottom
            const SizedBox(height: 80),
            const SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}