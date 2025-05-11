import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/onboarding_state.dart';

class OnboardingNotifier extends StateNotifier<OnboardingState> {
  OnboardingNotifier() : super(const OnboardingState());

  void setPickedObjects(List<String> list) =>
      state = state.copyWith(pickedObjects: list);

  void setPersona(String value) => state = state.copyWith(persona: value);

  void setFirstStory(String id) => state = state.copyWith(firstStoryId: id);
}

/// Riverpod provider
final onboardingProvider =
    StateNotifierProvider<OnboardingNotifier, OnboardingState>(
      (ref) => OnboardingNotifier(),
    );
