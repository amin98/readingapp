import 'package:flutter/material.dart';
import 'package:reading_app/data/story_data.dart'; // Import hardcoded stories
import 'package:reading_app/models/story.dart'; // Import the Story model
import 'package:reading_app/widgets/custom_progress_bar.dart';
import 'package:reading_app/widgets/themed_button.dart';

import '../../theme.dart'; // For kBg, kText

class ReadingInterfaceScreen extends StatefulWidget {
  final String storyId;
  const ReadingInterfaceScreen({super.key, required this.storyId});

  @override
  State<ReadingInterfaceScreen> createState() => _ReadingInterfaceScreenState();
}

class _ReadingInterfaceScreenState extends State<ReadingInterfaceScreen> {
  Story? _currentStory;
  int _currentPage = 0; // 0-indexed

  @override
  void initState() {
    super.initState();
    _loadStory();
  }

  void _loadStory() {
    setState(() {
      _currentStory = getStoryDetailsById(widget.storyId);
    });
  }

  void _nextPage() {
    if (_currentStory != null && _currentPage < _currentStory!.totalPages - 1) {
      setState(() {
        _currentPage++;
      });
    } else {
      // Last page reached, TODO: implement what happens next (e.g., navigate to rewards or back)
      print("End of story reached!");
      // For now, let's pop back as a placeholder action
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    if (_currentStory == null) {
      return Scaffold(
        backgroundColor: kBg,
        appBar: AppBar(title: const Text("Loading Story...")),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    final String storyTitle = _currentStory!.title;
    final int totalPages = _currentStory!.totalPages;
    final String currentPageContent = _currentStory!.contentPages[_currentPage];
    // final double currentBoltLevel = _currentStory!.boltLevels[_currentPage]; // Not used yet
    // final int currentCoins = _currentStory!.coinsPerPage[_currentPage]; // Not used yet

    return Scaffold(
      backgroundColor: kBg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: kText),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Page ${_currentPage + 1} of $totalPages', // Changed from Chapter
          style: textTheme.titleMedium?.copyWith(
            color: kText,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomProgressBar(
              currentValue: (_currentPage + 1).toDouble(),
              maxValue: totalPages.toDouble(),
              height: 10,
              borderRadius: 5,
            ),
            const SizedBox(height: 24.0),
            Text(
              storyTitle,
              textAlign: TextAlign.left,
              style: textTheme.headlineMedium?.copyWith(
                color: kText,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  currentPageContent,
                  style: textTheme.bodyLarge?.copyWith(
                    color: kText,
                    fontSize: 17,
                    height: 1.5,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            ThemedButton(
              text:
                  (_currentPage < totalPages - 1) ? "Continue" : "Finish Story",
              onPressed: _nextPage,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
