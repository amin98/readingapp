import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/onboarding_notifier.dart'; // Adjusted import path

class StoryPickerScreen extends ConsumerWidget {
  const StoryPickerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: Implement StoryPickerScreen UI and logic
    // Example: Access onboarding state: ref.watch(onboardingProvider).firstStoryId;
    // Example: Update onboarding state: ref.read(onboardingProvider.notifier).setFirstStory('story123');

    return Scaffold(
      backgroundColor: const Color(0xFFFFF3D7),
      appBar: AppBar(title: const Text('Pick Your First Story')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Story Picker Screen - Placeholder'),
            const SizedBox(height: 20),
            // Example: Display the chosen story ID if available
            Text(
              ref.watch(onboardingProvider).firstStoryId ??
                  'Story not yet picked',
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Example: Set a dummy story ID for now
                ref
                    .read(onboardingProvider.notifier)
                    .setFirstStory('sample_story_id_001'); // Example
                Navigator.pushNamed(context, 'guideChoice');
              },
              child: const Text('Next: Guide Choice'),
            ),
          ],
        ),
      ),
    );
  }
}
