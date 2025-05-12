import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'package:google_fonts/google_fonts.dart'; // Removed import

import '../../controllers/onboarding_notifier.dart'; // Adjusted import path
import '../../theme.dart'; // Import theme for kText if needed for Skip button
import '../../widgets/themed_button.dart'; // Added import for ThemedButton

class PersonaRevealScreen extends ConsumerWidget {
  const PersonaRevealScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // For now, we hardcode the persona to "Explorer" as requested.
    // Later, this will be determined by logic in OnboardingNotifier.
    const String displayedPersona = "Explorer";

    // Set the persona in the state if it's not already set or different.
    // This is a temporary measure until calculation logic is in place.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (ref.read(onboardingProvider).persona != displayedPersona) {
        ref.read(onboardingProvider.notifier).setPersona(displayedPersona);
      }
    });

    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 32.0,
              vertical: 24.0,
            ),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // To push Skip to bottom
              children: [
                Column(
                  // Group for top content
                  children: [
                    const SizedBox(height: 40), // Space from top
                    Text(
                      'You are...',
                      style: textTheme.headlineMedium?.copyWith(color: kText),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      displayedPersona, // Display hardcoded persona
                      style: textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: kText,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),
                    Image.asset(
                      'assets/objects/persona.png',
                      height: 280, // Adjusted height
                    ),
                    const SizedBox(height: 50),
                    ThemedButton(
                      text: 'Choose your Story',
                      width: 280,
                      onPressed: () {
                        Navigator.pushNamed(context, 'storyPicker');
                      },
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    // TODO: Implement skip logic - navigate to homepage, clear stack,
                    // and set onboarding_seen flag in SharedPreferences
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      'homepage',
                      (route) => false,
                    );
                  },
                  child: Text(
                    'Skip',
                    style: textTheme.titleMedium?.copyWith(
                      color: kText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
