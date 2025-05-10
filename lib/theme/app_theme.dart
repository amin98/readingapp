import 'package:flutter/material.dart';

/// Brand palette
const _cream = Color(0xFFF7EED6);
const _ink = Color(0xFF39210B);
const _primary = Color(0xFF0D74E3); // blue buttons
const _primaryDark = Color(0xFF0A5CC0);
const _warning = Color(0xFFE0B404);

class AppTheme {
  // --- Color Palette ---
  static const Color primaryColor = Color(0xFF0D74E3);
  static const Color primaryDarkColor = Color(0xFF0A5CC0);
  static const Color surfaceColor = Color(0xFFF7EED6);
  static const Color inkColor = Color(0xFF39210B);
  static const Color warningColor = Color(0xFFE0B404);

  // --- Spacing Scale (for reference, applied in widgets) ---
  // static const double spacingXXS = 4.0;
  // static const double spacingXS = 8.0;
  // static const double spacingS = 16.0;
  // static const double spacingM = 24.0;
  // static const double spacingL = 32.0;

  static ThemeData get theme {
    final baseTheme = ThemeData.from(
      colorScheme: ColorScheme(
        primary: primaryColor,
        onPrimary: Colors.white,
        primaryContainer: primaryDarkColor,
        onPrimaryContainer: Colors.white,
        secondary: primaryColor, // Using primary for secondary as not specified
        onSecondary: Colors.white,
        secondaryContainer: primaryDarkColor,
        onSecondaryContainer: Colors.white,
        tertiary: primaryColor, // Using primary for tertiary as not specified
        onTertiary: Colors.white,
        tertiaryContainer: primaryDarkColor,
        onTertiaryContainer: Colors.white,
        error: warningColor, // Or a dedicated error color if provided
        onError: inkColor,
        background: surfaceColor, // Typically surface is for components
        onBackground: inkColor,
        surface: surfaceColor,
        onSurface: inkColor,
        surfaceVariant: Color.alphaBlend(
          primaryColor.withOpacity(0.08),
          surfaceColor,
        ),
        onSurfaceVariant: inkColor,
        outline: inkColor.withOpacity(0.5),
        outlineVariant: inkColor.withOpacity(0.25),
        shadow: Colors.black.withOpacity(0.1),
        scrim: Colors.black.withOpacity(0.5),
        inverseSurface: inkColor,
        onInverseSurface: surfaceColor,
        inversePrimary: surfaceColor,
        brightness: Brightness.light,
      ),
      useMaterial3: true,
    );

    return baseTheme.copyWith(
      scaffoldBackgroundColor: surfaceColor,
      textTheme: _buildTextTheme(baseTheme.textTheme),
      filledButtonTheme: _buildFilledButtonTheme(),
      cardTheme: _buildCardTheme(),
      appBarTheme: AppBarTheme(
        backgroundColor: surfaceColor,
        foregroundColor: inkColor,
        elevation: 0,
        titleTextStyle: TextStyle(
          fontFamily: 'Roboto Slab',
          fontWeight: FontWeight.w700,
          fontSize: 20, // Example size, adjust as needed
          color: inkColor,
        ),
      ),
      // ElevatedButtonTheme is not being styled as per FilledButton preference
    );
  }

  static TextTheme _buildTextTheme(TextTheme base) {
    const String headingFont = 'Roboto Slab';
    const String bodyFont = 'System UI'; // Flutter will use system default

    return base
        .copyWith(
          displayLarge: base.displayLarge?.copyWith(
            fontFamily: headingFont,
            fontWeight: FontWeight.w700,
            color: inkColor,
          ),
          displayMedium: base.displayMedium?.copyWith(
            fontFamily: headingFont,
            fontWeight: FontWeight.w700,
            color: inkColor,
          ),
          displaySmall: base.displaySmall?.copyWith(
            fontFamily: headingFont,
            fontWeight: FontWeight.w700,
            color: inkColor,
          ),
          headlineLarge: base.headlineLarge?.copyWith(
            fontFamily: headingFont,
            fontWeight: FontWeight.w700,
            color: inkColor,
          ),
          headlineMedium: base.headlineMedium?.copyWith(
            fontFamily: headingFont,
            fontWeight: FontWeight.w700,
            color: inkColor,
          ),
          headlineSmall: base.headlineSmall?.copyWith(
            fontFamily: headingFont,
            fontWeight: FontWeight.w700,
            color: inkColor,
          ),
          titleLarge: base.titleLarge?.copyWith(
            fontFamily: headingFont,
            fontWeight: FontWeight.w400,
            color: inkColor,
          ),
          titleMedium: base.titleMedium?.copyWith(
            fontFamily: bodyFont,
            color: inkColor,
          ), // Body font for consistency
          titleSmall: base.titleSmall?.copyWith(
            fontFamily: bodyFont,
            color: inkColor,
          ), // Body font for consistency
          bodyLarge: base.bodyLarge?.copyWith(
            fontFamily: bodyFont,
            color: inkColor,
          ),
          bodyMedium: base.bodyMedium?.copyWith(
            fontFamily: bodyFont,
            color: inkColor,
          ),
          bodySmall: base.bodySmall?.copyWith(
            fontFamily: bodyFont,
            color: inkColor.withOpacity(0.7),
          ),
          labelLarge: base.labelLarge?.copyWith(
            fontFamily: bodyFont,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ), // For buttons
          labelMedium: base.labelMedium?.copyWith(
            fontFamily: bodyFont,
            color: inkColor,
          ),
          labelSmall: base.labelSmall?.copyWith(
            fontFamily: bodyFont,
            color: inkColor.withOpacity(0.7),
          ),
        )
        .apply(bodyColor: inkColor, displayColor: inkColor);
  }

  static FilledButtonThemeData _buildFilledButtonTheme() {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        disabledBackgroundColor: primaryColor.withOpacity(0.5),
        disabledForegroundColor: Colors.white.withOpacity(0.8),
        padding: const EdgeInsets.symmetric(
          vertical: 14,
        ), // 14px vertical padding
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // 8px radius
        ),
        textStyle: const TextStyle(
          fontFamily: 'System UI', // Body font for buttons
          fontWeight: FontWeight.w500, // Common weight for button text
          fontSize: 16, // Example size
        ),
      ),
    );
  }

  static CardTheme _buildCardTheme() {
    return CardTheme(
      elevation: 1, // Elevation 1
      color: surfaceColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // 12px radius
        side: BorderSide(
          color: inkColor.withOpacity(
            0.2,
          ), // 2px stroke (simulated with border)
          width: 2,
        ),
      ),
      margin: const EdgeInsets.all(8), // Default margin, can be overridden
    );
  }
}
