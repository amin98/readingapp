import 'dart:async'; // Import for Timer

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WorldBuildingScreen extends ConsumerStatefulWidget {
  const WorldBuildingScreen({super.key});

  @override
  ConsumerState<WorldBuildingScreen> createState() =>
      _WorldBuildingScreenState();
}

class _WorldBuildingScreenState extends ConsumerState<WorldBuildingScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 3), () {
      if (mounted) {
        // Check if the widget is still in the tree
        Navigator.pushNamed(context, 'personaReveal');
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Implement WorldBuildingScreen UI and logic
    // Example: Access onboarding state: ref.watch(onboardingProvider);
    // Example: Update onboarding state: ref.read(onboardingProvider.notifier).setSomeValue(...);

    return Scaffold(
      // backgroundColor is now inherited from the theme in main.dart
      appBar: AppBar(
        title: const Text('Building Your World...'),
      ), // Updated title
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0), // Added padding
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/objects/loadig.png', // Added image
                height: 250, // Example height, adjust as needed
              ),
              const SizedBox(height: 40), // Increased spacing
              Text(
                'Crafting your unique space...', // Updated placeholder text
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40), // Increased spacing
              // Styled Button from WelcomeScreen
              // ThemedButton(
              //   text: 'Next',
              //   width: 250, // Adjusted width for this screen
              //   onPressed: () {
              //     _timer?.cancel(); // Cancel timer if manually navigating
              //     // TODO: Add logic to update onboarding state if needed
              //     Navigator.pushNamed(context, 'personaReveal');
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
