import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:google_fonts/google_fonts.dart'; // Removed import
import 'package:shared_preferences/shared_preferences.dart';

import '../../controllers/onboarding_notifier.dart'; // Adjusted import path
import '../../theme.dart'; // For kBg, kText, kPrimary
import '../../widgets/secondary_button.dart'; // Import SecondaryButton
import '../../widgets/themed_button.dart';
import '../homepage_screen.dart'; // For navigation
import '../reading_interface_screen.dart'; // Import ReadingInterfaceScreen
import './story_picker_screen.dart'; // For Story class and getStoryById

class GuideChoiceScreen extends ConsumerWidget {
  const GuideChoiceScreen({super.key});

  Future<void> _continueToHome(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seen_onboarding', true);

    if (context.mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => HomepageScreen()),
        (_) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final String? storyId = ref.watch(onboardingProvider).firstStoryId;
    final Story? selectedStory = storyId != null ? getStoryById(storyId) : null;
    // Default to a placeholder if story is not found, though this shouldn't happen in normal flow
    final String storyTitle = selectedStory?.name ?? "Selected Story";
    final String storyImageAsset =
        selectedStory?.imageAsset ??
        'assets/story_images/through_dusk.png'; // Fallback image

    return Scaffold(
      backgroundColor: kBg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: kText),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10.0,
            left: 40.0,
            right: 40.0,
            bottom: 20.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Would you like a guide?',
                textAlign: TextAlign.center,
                style: textTheme.headlineSmall?.copyWith(
                  color: kText,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0),
              Stack(
                alignment: Alignment.center,
                children: [
                  // Image.asset( // REMOVED this widget
                  //   'assets/book_cover_images/book_cover_brown.png', // Main book cover
                  //   height: 300, // Adjust as needed
                  //   fit: BoxFit.contain,
                  // ),
                  Positioned(
                    top:
                        60, // Adjust this value to position the story image correctly
                    child: ClipRRect(
                      // Optional: if story images need to be clipped to a certain shape
                      // borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        storyImageAsset, // Chosen story image
                        height: 130, // Adjust as needed
                        width: 130, // Adjust as needed
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom:
                        45, // Adjust this value to position the text correctly
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      // Optional: add a background to the text if needed for readability
                      // color: Colors.black.withOpacity(0.5),
                      child: Text(
                        storyTitle,
                        textAlign: TextAlign.center,
                        style: textTheme.headlineSmall?.copyWith(
                          color: const Color(0xFF301504), // Changed color
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32.0),
              ThemedButton(
                text: 'Start Reading',
                onPressed: () {
                  // TODO: Set guide if any, then navigate
                  if (storyId != null) {
                    // Ensure storyId is available
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (_) => ReadingInterfaceScreen(storyId: storyId),
                      ),
                    );
                  } else {
                    // Optional: Handle the case where storyId is null, e.g., show a message
                    print(
                      "Error: Story ID is null, cannot navigate to reading interface.",
                    );
                  }
                },
                width: double.infinity,
              ),
              const SizedBox(height: 16),
              SecondaryButton(
                text: 'Continue to Home',
                onPressed: () => _continueToHome(context),
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
