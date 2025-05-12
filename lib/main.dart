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

  final baseTextTheme = GoogleFonts.robotoSlabTextTheme();
  final customTextTheme = baseTextTheme.apply(
    bodyColor: kText,
    displayColor: kText,
  );

  runApp(
    ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: kBg,
          colorScheme: ColorScheme.fromSeed(seedColor: kPrimary).copyWith(
            primary: kPrimary,
            onPrimary: Colors.white, // Color for text/icons on primary color
            surface: kBg, // Background color for cards, dialogs, etc.
            onSurface: kText, // Color for text/icons on surface color
          ),
          textTheme: customTextTheme,
          primaryTextTheme: customTextTheme, // Ensure primary text also uses it
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.transparent,
            foregroundColor: kText,
            elevation: 0,
            titleTextStyle:
                customTextTheme.headlineSmall, // Example, adjust as needed
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white, // Text color on button
              backgroundColor: kPrimary, // Button background color
              textStyle:
                  customTextTheme
                      .labelLarge, // Apply Roboto Slab to button text
            ),
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: kPrimary, // Default color for TextButton text
              textStyle: customTextTheme.labelLarge, // Apply Roboto Slab
            ),
          ),
          dialogTheme: DialogTheme(
            titleTextStyle:
                customTextTheme.headlineSmall, // For AlertDialog.title
            contentTextStyle:
                customTextTheme.bodyMedium, // For AlertDialog.content
          ),
          snackBarTheme: SnackBarThemeData(
            contentTextStyle: customTextTheme.bodyMedium?.copyWith(
              color: Colors.white,
            ), // Example color
          ),
        ),
        home: const OnboardingCoordinator(),
      ),
    ),
  );
}
