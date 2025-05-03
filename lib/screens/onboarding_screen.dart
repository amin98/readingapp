import 'package:flutter/material.dart';

import 'homepage_screen.dart'; // To navigate to the homepage

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Placeholder data for scene cards
  final List<Map<String, dynamic>> _sceneCards = [
    {'title': 'Dreamer', 'color': Colors.lightBlueAccent},
    {'title': 'Chaos Kid', 'color': Colors.orangeAccent},
    {'title': 'Quiet One', 'color': Colors.deepPurpleAccent},
    {'title': 'Adventurer', 'color': Colors.greenAccent},
    {'title': 'Thinker', 'color': Colors.grey},
    {'title': 'Creator', 'color': Colors.pinkAccent},
  ];

  void _onNextPressed() {
    if (_currentPage < _sceneCards.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Last card selected, log and navigate
      final selectedProfile = _sceneCards[_currentPage]['title'];
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomepageScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Build Your Reading Profile'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black87,
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _sceneCards.length,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (context, index) {
                return SceneCard(
                  title: _sceneCards[index]['title'],
                  color: _sceneCards[index]['color'],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: ElevatedButton(
              onPressed: _onNextPressed,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50), // Full width
              ),
              child: Text(
                _currentPage < _sceneCards.length - 1 ? 'Next' : 'Finish',
              ),
            ),
          ),
          const SizedBox(height: 20), // Spacing at the bottom
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

// Simple Scene Card Widget (using colored containers as placeholders)
class SceneCard extends StatelessWidget {
  final String title;
  final Color color;

  const SceneCard({super.key, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((0.1 * 255).round()),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
