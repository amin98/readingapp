import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Add this import for HapticFeedback
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/onboarding_notifier.dart';
import '../../theme.dart';

class VibePickerScreen extends ConsumerStatefulWidget {
  const VibePickerScreen({super.key});
  @override
  ConsumerState<VibePickerScreen> createState() => _VibePickerScreenState();
}

class _VibePickerScreenState extends ConsumerState<VibePickerScreen> {
  // Asset file names (without path).
  final List<String> objects = [
    '500x500_1-min.png',
    '500x500_2-min.png',
    '500x500_3-min.png',
    '500x500_4-min.png',
    '500x500_6-min.png',
    '500x500_7-min.png',
    '500x500_8-min.png',
    '500x500_10-min.png',
  ];

  final CarouselSliderController _controller = CarouselSliderController();
  int currentIndex = 0;
  final Set<String> selected = {};

  void _toggle(String asset) {
    // Add haptic feedback
    HapticFeedback.vibrate();

    setState(() {
      if (selected.contains(asset)) {
        selected.remove(asset);
      } else if (selected.length < 3) {
        selected.add(asset);
      }
    });
  }

  Future<void> _tryContinue() async {
    final ok =
        await showDialog<bool>(
          context: context,
          builder:
              (dialogContext) => _ConfirmationDialog(
                assets: selected.toList(),
              ), // Use dialogContext
        ) ??
        false;
    if (!ok || !mounted) return; // mounted check

    // Persist to Riverpod
    ref.read(onboardingProvider.notifier).setPickedObjects(selected.toList());

    Navigator.pushNamed(context, 'worldBuilding');
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 24),
          Text(
            'Pick 3 objects that\nfit your vibe',
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          CarouselSlider.builder(
            carouselController: _controller,
            itemCount: objects.length,
            options: CarouselOptions(
              height: 320,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              viewportFraction: 0.65,
              onPageChanged: (i, _) => setState(() => currentIndex = i),
            ),
            itemBuilder: (_, i, __) {
              final asset = objects[i];
              final isSel = selected.contains(asset);
              return GestureDetector(
                onTap: () => _toggle(asset),
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final PADDING = 4.0;
                    // Use the smaller of the constrained width or height to ensure we can make a square
                    // that fits within the carousel item slot, accounting for padding.
                    final double constrainedWidth =
                        constraints.maxWidth - (PADDING * 2);
                    final double constrainedHeight =
                        constraints.maxHeight - (PADDING * 2);
                    final double squareSizeForContainer =
                        constrainedWidth < constrainedHeight
                            ? constrainedWidth
                            : constrainedHeight;

                    // The AnimatedContainer itself will be this square size
                    // Its padding is PADDING all around.
                    // The ClipOval child will fill the space *inside* the padding.

                    return Center(
                      child: AnimatedContainer(
                        width:
                            squareSizeForContainer +
                            (PADDING * 2), // Outer size including padding
                        height:
                            squareSizeForContainer +
                            (PADDING * 2), // Outer size including padding
                        duration: kThemeAnimationDuration,
                        padding: EdgeInsets.all(PADDING),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isSel ? kPrimary : Colors.transparent,
                            width: 4,
                          ),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/objects/$asset',
                            fit: BoxFit.cover,
                            // Width and height for Image.asset removed
                            // It will fill the space provided by ClipOval
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
          const Spacer(),
          // Mini indicator row ▼
          SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (i) {
                final asset =
                    selected.length > i ? selected.elementAt(i) : null;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child:
                      asset == null
                          ? _EmptyDot() // grey empty circle
                          : _SelectedDot(
                            asset: asset,
                            onRemove: () => _toggle(asset),
                          ),
                );
              }),
            ),
          ),
          const SizedBox(height: 12),
          // Continue button ▼
          AnimatedOpacity(
            duration: const Duration(milliseconds: 250),
            opacity: selected.length == 3 ? 1 : 0,
            child: IgnorePointer(
              ignoring: selected.length != 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF1B7DD5),
                      borderRadius: BorderRadius.circular(13),
                      border: const Border(
                        bottom: BorderSide(color: Color(0xFF196AB2), width: 4),
                      ),
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: _tryContinue,
                      child: Center(
                        child: Text(
                          'Continue',
                          style: Theme.of(
                            context,
                          ).textTheme.titleLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    ),
  );
}

/// Grey empty placeholder circle
class _EmptyDot extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
    width: 48,
    height: 48,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.grey.shade300,
    ),
  );
}

/// Mini selected image with removable minus icon
class _SelectedDot extends StatelessWidget {
  const _SelectedDot({required this.asset, required this.onRemove});
  final String asset;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) => Stack(
    clipBehavior: Clip.none,
    children: [
      Container(
        width: 48,
        height: 48,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: kPrimary),
        ),
        child: ClipOval(
          child: Image.asset('assets/objects/$asset', fit: BoxFit.cover),
        ),
      ),
      Positioned(
        right: -6,
        bottom: -6,
        child: GestureDetector(
          onTap: onRemove,
          child: Container(
            width: 20,
            height: 20,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.remove, size: 16, color: kPrimary),
          ),
        ),
      ),
    ],
  );
}

/// Confirmation dialog mirroring the Figma
class _ConfirmationDialog extends StatelessWidget {
  const _ConfirmationDialog({required this.assets});
  final List<String> assets;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      backgroundColor: kBg, // Using kBg from theme.dart
      title: Text(
        'Your chosen objects!',
        textAlign: TextAlign.center,
        style: textTheme.titleLarge?.copyWith(
          color: kText,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:
            assets
                .map(
                  (a) => ClipOval(
                    child: Image.asset(
                      'assets/objects/$a',
                      width: 75, // Slightly larger for better visibility
                      height: 75,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
                .toList(),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: const EdgeInsets.only(
        bottom: 24.0,
        left: 14.0,
        right: 14.0,
      ),
      actions: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4A4A4A),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            ),
            onPressed: () => Navigator.pop(context, false),
            child: Text(
              'Go Back',
              style: textTheme.titleMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            ),
            onPressed: () => Navigator.pop(context, true),
            child: Text(
              'Confirm', // Changed from "Yes, continue"
              style: textTheme.titleMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
