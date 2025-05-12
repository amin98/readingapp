import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Add this import for HapticFeedback

import '../../theme.dart'; // For kText

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final double height;
  final double borderRadius;
  final TextStyle? textStyle;

  const SecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width, // Default width will be handled by SizedBox or parent constraints
    this.height = 52.0, // Default height consistent with ThemedButton
    this.borderRadius =
        13.0, // Default border radius consistent with ThemedButton
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    const Color mainButtonColor = Color(0xFFEFD9A6);
    const Color bottomBorderColor = Color(0xFFCCB277);
    const Color textColor = kText; // Using kText from theme.dart

    return SizedBox(
      width: width,
      height: height,
      child: Container(
        decoration: BoxDecoration(
          color: mainButtonColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: const Border(
            bottom: BorderSide(
              color: bottomBorderColor,
              width: 4, // Consistent with ThemedButton
            ),
          ),
        ),
        child: TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                10,
              ), // Consistent with ThemedButton
            ),
            foregroundColor: textColor.withOpacity(0.1), // Ripple effect color
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
              style:
                  textStyle ??
                  Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: textColor,
                    fontWeight: FontWeight.w600, // Consistent with ThemedButton
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
