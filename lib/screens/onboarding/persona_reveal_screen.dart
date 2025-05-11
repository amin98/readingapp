import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/onboarding_notifier.dart'; // Adjusted import path

class PersonaRevealScreen extends ConsumerWidget {
  const PersonaRevealScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: Implement PersonaRevealScreen UI and logic
    // Example: Access onboarding state: ref.watch(onboardingProvider).persona;
    // Example: Update onboarding state: ref.read(onboardingProvider.notifier).setPersona('Explorer');

    return Scaffold(
      backgroundColor: const Color(0xFFFFF3D7),
      appBar: AppBar(title: const Text('Your Persona')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Persona Reveal Screen - Placeholder'),
            const SizedBox(height: 20),
            // Example: Display the persona if available
            Text(
              ref.watch(onboardingProvider).persona ?? 'Persona not yet set',
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Example: Set a dummy persona for now
                ref
                    .read(onboardingProvider.notifier)
                    .setPersona('Dreamer'); // Example
                Navigator.pushNamed(context, 'storyPicker');
              },
              child: const Text('Next: Story Picker'),
            ),
          ],
        ),
      ),
    );
  }
}
