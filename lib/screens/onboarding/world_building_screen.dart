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
      backgroundColor: const Color(0xFFFFF3D7),
      appBar: AppBar(title: const Text('World Building')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('World Building Screen - Placeholder'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _timer?.cancel(); // Cancel timer if manually navigating
                // TODO: Add logic to update onboarding state if needed
                Navigator.pushNamed(context, 'personaReveal');
              },
              child: const Text('Next: Persona Reveal (or wait 3s)'),
            ),
          ],
        ),
      ),
    );
  }
}
