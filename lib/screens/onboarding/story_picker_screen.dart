import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:google_fonts/google_fonts.dart'; // Removed import

import '../../controllers/onboarding_notifier.dart'; // Adjusted import path
import '../../theme.dart'; // Import theme for kBg, kText, kPrimary
import '../../widgets/themed_button.dart'; // Import ThemedButton
import '../homepage_screen.dart'; // For Skip navigation

// Simple class to hold story data
class Story {
  final String id;
  final String name;
  final String imageAsset;

  Story({required this.id, required this.name, required this.imageAsset});
}

// Helper function to get story details by ID (temporary)
Story? getStoryById(String storyId) {
  // This assumes the _stories list is accessible here or passed/managed differently.
  // For now, let's redefine it for this helper.
  final List<Story> stories = [
    Story(
      id: 'fake_pines',
      name: 'Fake Pines',
      imageAsset: 'assets/story_images/fake_pines.png',
    ),
    Story(
      id: 'tunnel_vision',
      name: 'Tunnel Vision',
      imageAsset: 'assets/story_images/tunnel_vision.png',
    ),
    Story(
      id: 'hidden_path',
      name: 'Hidden Path',
      imageAsset: 'assets/story_images/hidden_path.png',
    ),
    Story(
      id: 'through_dusk',
      name: 'Through Dusk',
      imageAsset: 'assets/story_images/through_dusk.png',
    ),
    Story(
      id: 'echoing_steps',
      name: 'Echoing Steps',
      imageAsset: 'assets/story_images/echoing_steps.png',
    ),
    Story(
      id: 'somewhere_not_here',
      name: 'Somewhere not here',
      imageAsset: 'assets/story_images/somewhere_not_here.png',
    ),
  ];
  try {
    return stories.firstWhere((story) => story.id == storyId);
  } catch (e) {
    return null; // Story not found
  }
}

class StoryPickerScreen extends ConsumerStatefulWidget {
  const StoryPickerScreen({super.key});

  @override
  ConsumerState<StoryPickerScreen> createState() => _StoryPickerScreenState();
}

class _StoryPickerScreenState extends ConsumerState<StoryPickerScreen> {
  String? _selectedStoryId;

  // Hardcoded list of stories
  final List<Story> _stories = [
    Story(
      id: 'fake_pines',
      name: 'Fake Pines',
      imageAsset: 'assets/story_images/fake_pines.png',
    ),
    Story(
      id: 'tunnel_vision',
      name: 'Tunnel Vision',
      imageAsset: 'assets/story_images/tunnel_vision.png',
    ),
    Story(
      id: 'hidden_path',
      name: 'Hidden Path',
      imageAsset: 'assets/story_images/hidden_path.png',
    ),
    Story(
      id: 'through_dusk',
      name: 'Through Dusk',
      imageAsset: 'assets/story_images/through_dusk.png',
    ),
    Story(
      id: 'echoing_steps',
      name: 'Echoing Steps',
      imageAsset: 'assets/story_images/echoing_steps.png',
    ),
    Story(
      id: 'somewhere_not_here',
      name: 'Somewhere not here',
      imageAsset: 'assets/story_images/somewhere_not_here.png',
    ),
  ];

  void _selectStory(String storyId) {
    setState(() {
      _selectedStoryId = storyId;
    });
  }

  Future<void> _skipOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seen_onboarding', true);
    if (mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => HomepageScreen()),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: kBg, // Use theme color kBg
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Make AppBar transparent
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: kText, // Use kText for icon color
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Pick your first Story',
          style: textTheme.headlineSmall?.copyWith(
            color: kText, // Use kText for title
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  itemCount: _stories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio:
                        0.85, // Adjust as needed for card proportions
                  ),
                  itemBuilder: (context, index) {
                    final story = _stories[index];
                    final isSelected = _selectedStoryId == story.id;
                    return GestureDetector(
                      onTap: () => _selectStory(story.id),
                      child: Card(
                        elevation: isSelected ? 6.0 : 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          side: BorderSide(
                            color:
                                isSelected
                                    ? kPrimary
                                    : Colors
                                        .transparent, // Use theme color kPrimary for border
                            width: isSelected ? 3.0 : 0.0,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  story.imageAsset,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: 12.0,
                                top: 4.0,
                              ),
                              child: Text(
                                story.name,
                                textAlign: TextAlign.center,
                                style: textTheme.titleSmall?.copyWith(
                                  color: kText, // Use kText for story name
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              if (_selectedStoryId != null)
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                  child: ThemedButton(
                    text: 'Continue',
                    onPressed: () {
                      ref
                          .read(onboardingProvider.notifier)
                          .setFirstStory(_selectedStoryId!);
                      Navigator.pushNamed(context, 'guideChoice');
                    },
                    width: double.infinity, // Make button wide
                  ),
                ),
              TextButton(
                onPressed: _skipOnboarding,
                child: Text(
                  'Skip',
                  style: textTheme.titleMedium?.copyWith(
                    color: kText, // Use theme color kText for skip button
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
