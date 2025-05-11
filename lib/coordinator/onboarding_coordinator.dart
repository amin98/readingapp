import 'package:flutter/material.dart';

import '../screens/onboarding/guide_choice_screen.dart';
import '../screens/onboarding/persona_reveal_screen.dart';
import '../screens/onboarding/story_picker_screen.dart';
import '../screens/onboarding/vibe_picker_screen.dart';
import '../screens/onboarding/welcome_screen.dart';
import '../screens/onboarding/world_building_screen.dart';

class OnboardingCoordinator extends StatelessWidget {
  const OnboardingCoordinator({super.key});

  @override
  Widget build(BuildContext context) => Navigator(
    initialRoute: 'welcome',
    onGenerateRoute: (settings) {
      switch (settings.name) {
        case 'welcome':
          return MaterialPageRoute(builder: (_) => const WelcomeScreen());
        case 'vibePicker':
          return MaterialPageRoute(builder: (_) => const VibePickerScreen());
        case 'worldBuilding':
          return MaterialPageRoute(builder: (_) => const WorldBuildingScreen());
        case 'personaReveal':
          return MaterialPageRoute(builder: (_) => const PersonaRevealScreen());
        case 'storyPicker':
          return MaterialPageRoute(builder: (_) => const StoryPickerScreen());
        case 'guideChoice':
          return MaterialPageRoute(builder: (_) => const GuideChoiceScreen());
        default:
          return null; // Should not happen with defined routes
      }
    },
  );
}
