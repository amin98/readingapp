import 'package:flutter/material.dart';
import 'package:reading_app/theme/app_theme.dart'; // Ensure this is the only import for app_theme

import 'screens/homepage_screen.dart'; // Import the homepage screen
import 'screens/onboarding_screen.dart'; // Import the *correct* onboarding screen
import 'screens/welcome_screen.dart'; // Import the Welcome screen

// import 'theme/app_theme.dart';
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
      theme: AppTheme.theme, // Correctly apply AppTheme.theme here
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/discovery': (context) => HomepageScreen(),
      },
    );
  }
}
