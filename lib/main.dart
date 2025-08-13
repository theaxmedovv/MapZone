import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/pages/%20login_page.dart';

import 'pages/login_page.dart';
import 'pages/landing_page1.dart';
import 'pages/landing_page2.dart';
import 'services/auth_storage.dart';

import 'home/main_screen.dart';
import 'home/running_info_page.dart';
import 'home/running_programs_detail_page.dart';
import 'home/running_programs_page.dart';
import 'home/history_page.dart';
import 'home/clubs_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFB0FF00),
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        cardTheme: CardThemeData(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
      initialRoute: '/landing',
      routes: {
        '/landing': (context) => const LandingPage1(),
        '/login': (context) => const LoginPage(),
        '/main': (context) {
          final args =
              ModalRoute.of(context)?.settings.arguments as String? ?? '';
          return MainScreen(username: args);
        },
        '/club_info': (context) => const RunningInfoPage(),
        '/program_detail': (context) => const RunningProgramDetailPage(),
        '/program_schedule': (context) => const ProgramSchedulePage(),
      },
    );
  }
}
