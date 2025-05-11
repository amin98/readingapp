import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'package:shared_preferences/shared_preferences.dart'; // No longer needed here

import 'coordinator/onboarding_coordinator.dart';
import 'theme.dart';
// import 'screens/homepage_screen.dart'; // No longer needed for initial routing

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // final prefs = await SharedPreferences.getInstance(); // Removed
  // final seen = prefs.getBool('seen_onboarding') ?? false; // Removed

  runApp(
    ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: kBg,
          colorScheme: ColorScheme.fromSeed(
            seedColor: kPrimary,
          ).copyWith(onPrimary: Colors.white, primary: kPrimary),
          textTheme: GoogleFonts.playfairDisplayTextTheme().apply(
            bodyColor: kText,
            displayColor: kText,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            foregroundColor: kText,
            elevation: 0,
          ),
        ),
        home: const OnboardingCoordinator(),
      ),
    ),
  );
}
