/// Immutable state used by Riverpod.
class OnboardingState {
  final List<String> pickedObjects; // exactly 3 expected
  final String? persona; // e.g. "Explorer"
  final String? firstStoryId; // chosen in step 5

  const OnboardingState({
    this.pickedObjects = const [],
    this.persona,
    this.firstStoryId,
  });

  bool get isComplete =>
      pickedObjects.length == 3 && persona != null && firstStoryId != null;

  OnboardingState copyWith({
    List<String>? pickedObjects,
    String? persona,
    String? firstStoryId,
  }) => OnboardingState(
    pickedObjects: pickedObjects ?? this.pickedObjects,
    persona: persona ?? this.persona,
    firstStoryId: firstStoryId ?? this.firstStoryId,
  );
}
