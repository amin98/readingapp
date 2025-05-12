import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Add this import for HapticFeedback

class ThemedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final double height;

  const ThemedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width, // Default width will be handled by SizedBox or parent constraints
    this.height = 52.0, // Default height consistent with existing buttons
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width, // Use provided width, or null to let parent decide
      height: height,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(
            0xFF1B7DD5,
          ), // todo: consider making this themable or a parameter
          borderRadius: BorderRadius.circular(13),
          border: const Border(
            bottom: BorderSide(
              color: Color(
                0xFF196AB2,
              ), // todo: consider making this themable or a parameter
              width: 4,
            ),
          ),
        ),
        child: TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            foregroundColor:
                Colors.white, // Ensuring ripple effect is visible on dark bg
          ),
          onPressed: () {
            // Add haptic feedback
            HapticFeedback.lightImpact();
            // Call the actual onPressed handler
            onPressed();
          },
          child: Center(
            child: Text(
              text,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
