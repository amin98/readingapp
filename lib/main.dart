import 'package:flutter/material.dart';

import 'screens/homepage_screen.dart'; // Import the homepage screen
import 'screens/onboarding_screen.dart'; // Import the *correct* onboarding screen
import 'screens/welcome_screen.dart'; // Import the Welcome screen

void main() {
  runApp(const ReadingApp());
}

class ReadingApp extends StatelessWidget {
  const ReadingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reading App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true, // Optional: Enable Material 3
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/discovery': (context) => HomepageScreen(),
      },
    );
  }
}
