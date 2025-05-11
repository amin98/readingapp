import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controllers/onboarding_notifier.dart'; // Adjusted import path
import '../homepage_screen.dart'; // For navigation

class GuideChoiceScreen extends ConsumerWidget {
  const GuideChoiceScreen({super.key});

  Future<void> _finishOnboarding(BuildContext context, WidgetRef ref) async {
    // Here you would typically set the chosen guide if that were part of the state.
    // For now, we just mark onboarding as complete and navigate.

    // Ensure the onboarding state is complete before finishing.
    // You might want to add more robust checks based on your app's logic.
    final onboardingState = ref.read(onboardingProvider);
    if (!onboardingState.isComplete) {
      // Optionally show a dialog or prevent finishing if state is not complete
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please complete all onboarding steps.')),
      );
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seen_onboarding', true);

    if (context.mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => HomepageScreen(),
        ), // Corrected constructor
        (_) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: Implement GuideChoiceScreen UI and logic

    return Scaffold(
      backgroundColor: const Color(0xFFFFF3D7),
      appBar: AppBar(title: const Text('Choose Your Guide')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Guide Choice Screen - Placeholder'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _finishOnboarding(context, ref),
              child: const Text('Finish Onboarding'),
            ),
          ],
        ),
      ),
    );
  }
}
