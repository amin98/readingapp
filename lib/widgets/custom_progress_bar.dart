import 'package:flutter/material.dart';

class CustomProgressBar extends StatelessWidget {
  final double currentValue;
  final double maxValue;
  final double height;
  final Color backgroundColor;
  final Color progressColor;
  final double borderRadius;

  const CustomProgressBar({
    super.key,
    required this.currentValue,
    required this.maxValue,
    this.height = 12.0,
    this.backgroundColor = const Color(0xFFF0E6D0), // Light cream
    this.progressColor = const Color(0xFF4A90E2), // Medium blue
    this.borderRadius = 6.0, // Default to half of default height
  });

  @override
  Widget build(BuildContext context) {
    double progress = 0.0;
    if (maxValue > 0 && currentValue > 0) {
      progress = currentValue / maxValue;
      if (progress < 0) progress = 0;
      if (progress > 1) progress = 1;
    }

    return Container(
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Stack(
        children: [
          FractionallySizedBox(
            widthFactor: progress,
            child: Container(
              decoration: BoxDecoration(
                color: progressColor,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
