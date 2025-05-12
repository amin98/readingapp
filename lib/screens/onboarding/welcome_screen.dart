import 'package:flutter/material.dart';

import '../../widgets/themed_button.dart';
// import 'package:google_fonts/google_fonts.dart'; // Removed

/// One-time splash shown on first launch.
/// After the user taps **Continue** you should push to the vibe picker
/// and persist a `hasSeenWelcome` flag so this route is skipped next time.
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  // ──────────────────── design constants ────────────────────
  static const _kSidePadding = 32.0;
  static const _kVerticalGap = 24.0;
  static const _kIllustrationHeight = 300.0;
  static const _kButtonHeight = 56.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3D7), // Applied new background color
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: _kSidePadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: _kVerticalGap),
                // — headline —
                Text(
                  'Welcome to your new\nreading experience!',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF351A09),
                  ),
                ),

                const SizedBox(height: _kVerticalGap),
                // — hero illustration —
                SizedBox(
                  height: _kIllustrationHeight,
                  child: Image.asset(
                    'assets/illustrations/welcome_illustration.png',
                    fit: BoxFit.contain,
                  ),
                ),

                const SizedBox(height: _kVerticalGap),
                // — sub-headline —
                Text(
                  'The goal is simple:\nFind your vibe.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    height: 1.35,
                    color: const Color(0xFF351A09),
                  ),
                ),

                const SizedBox(height: _kVerticalGap * 2),
                // — primary action —
                ThemedButton(
                  text: 'Continue',
                  onPressed: () => Navigator.pushNamed(context, 'vibePicker'),
                  width: 200,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
