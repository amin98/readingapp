/// Immutable state used by Riverpod.
class OnboardingState {
  final List<String> pickedObjects; // exactly 3 expected
  final String? persona; // e.g. "Explorer"
  final String? firstStoryId; // chosen in step 5
  final List<String> availablePersonas; // Added list of available personas

  const OnboardingState({
    this.pickedObjects = const [],
    this.persona,
    this.firstStoryId,
    // Initialize with default personas, including "Explorer"
    this.availablePersonas = const [
      "Explorer",
      "Dreamer",
      "Creator",
      "Sage",
      "Jester",
    ],
  });

  bool get isComplete =>
      pickedObjects.length == 3 && persona != null && firstStoryId != null;

  OnboardingState copyWith({
    List<String>? pickedObjects,
    String? persona,
    String? firstStoryId,
    List<String>? availablePersonas, // Added to copyWith
  }) => OnboardingState(
    pickedObjects: pickedObjects ?? this.pickedObjects,
    persona: persona ?? this.persona,
    firstStoryId: firstStoryId ?? this.firstStoryId,
    availablePersonas:
        availablePersonas ?? this.availablePersonas, // Added to copyWith
  );
}
