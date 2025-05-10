import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// One-time splash shown on first launch.
/// After the user taps **Continue** you should push `/onboarding`
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
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface, // pale cream in your scheme
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
                  style: GoogleFonts.robotoSlab(
                    fontSize:
                        Theme.of(context).textTheme.headlineMedium?.fontSize,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).textTheme.headlineLarge?.color,
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
                  style: GoogleFonts.robotoSlab(
                    fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                    height: 1.35,
                    color: Theme.of(context).textTheme.titleLarge?.color,
                  ),
                ),

                const SizedBox(height: _kVerticalGap * 2),
                // — primary action —
                SizedBox(
                  width: 200,
                  height: _kButtonHeight,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF1B7DD5), // flat blue background
                      borderRadius: BorderRadius.circular(13),
                      border: const Border(
                        bottom: BorderSide(
                          color: Color(
                            0xFF196AB2,
                          ), // mimic CSS-like bottom border
                          width: 4,
                        ),
                      ),
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding:
                            EdgeInsets
                                .zero, // Let the Container handle the sizing
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed:
                          () => Navigator.pushNamed(context, '/onboarding'),
                      child: Center(
                        child: Text(
                          'Continue',
                          style: GoogleFonts.robotoSlab(
                            fontSize:
                                Theme.of(
                                  context,
                                ).textTheme.titleLarge?.fontSize,
                            height: 1.35,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
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
