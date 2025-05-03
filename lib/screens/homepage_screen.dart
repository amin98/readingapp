import 'package:flutter/material.dart';

class HomepageScreen extends StatelessWidget {
  HomepageScreen({super.key});

  // Placeholder data for story recommendations
  final Map<String, List<Map<String, String>>> _recommendations = {
    'Mystery': [
      {
        'title': 'The Silent Witness',
        'description': 'A detective chases a ghost.',
      },
      {'title': 'Locked Room', 'description': 'An impossible crime unfolds.'},
      {
        'title': 'Shadows in the Fog',
        'description': 'Secrets hide in the mist.',
      },
    ],
    'Fantasy': [
      {'title': 'Dragon\'s Peak', 'description': 'A quest for ancient power.'},
      {'title': 'Elfwood', 'description': 'Magic stirs in the forest.'},
    ],
    'Sci-Fi': [
      {'title': 'Star Voyager', 'description': 'Exploring distant galaxies.'},
      {'title': 'Cyber City', 'description': 'Life in a futuristic world.'},
      {'title': 'Time Warp', 'description': 'A journey through ages.'},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discover Stories'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        children:
            _recommendations.entries.map((entry) {
              return StoryList(genre: entry.key, stories: entry.value);
            }).toList(),
      ),
    );
  }
}

// Widget for a horizontal list of stories for a specific genre
class StoryList extends StatelessWidget {
  final String genre;
  final List<Map<String, String>> stories;

  const StoryList({super.key, required this.genre, required this.stories});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            genre,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 220, // Adjust height as needed
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            itemCount: stories.length,
            itemBuilder: (context, index) {
              return StoryItem(
                title: stories[index]['title']!,
                description: stories[index]['description']!,
              );
            },
          ),
        ),
        const SizedBox(height: 16), // Spacing between lists
      ],
    );
  }
}

// Widget for an individual story item
class StoryItem extends StatelessWidget {
  final String title;
  final String description;

  const StoryItem({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150, // Fixed width for each story card
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Card(
        elevation: 3,
        clipBehavior: Clip.antiAlias, // Ensures content respects border radius
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              color: Colors.grey[300], // Placeholder for image
              child: const Center(
                child: Icon(Icons.image_not_supported, color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodySmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
