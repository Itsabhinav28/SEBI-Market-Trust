import 'package:flutter/material.dart';

class AppColors {
  // Primary Color Palette
  static const Color primaryDark = Color(0xFF324E7B); // Dark blue
  static const Color primaryLight = Color(0xFF86A6DF); // Light blue
  static const Color primaryMedium = Color(0xFF5068A9); // Medium blue
  static const Color backgroundLight = Color(0xFFF8F8F8); // Off-white

  // Derived Colors
  static const Color primaryDarkWithOpacity = Color(0x80324E7B);
  static const Color primaryLightWithOpacity = Color(0x8086A6DF);
  static const Color primaryMediumWithOpacity = Color(0x805068A9);

  // Gradient Definitions
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryDark, primaryMedium],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient lightGradient = LinearGradient(
    colors: [primaryLight, primaryMedium],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient subtleGradient = LinearGradient(
    colors: [backgroundLight, Colors.white],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // Status Colors (using the new palette)
  static const Color success = Color(0xFF27AE60);
  static const Color warning = Color(0xFFE67E22);
  static const Color error = Color(0xFFE74C3C);
  static const Color info = primaryMedium;

  // Text Colors
  static const Color textPrimary = primaryDark;
  static const Color textSecondary = Color(0xFF64748B);
  static const Color textLight = Color(0xFF94A3B8);
  static const Color textOnDark = Colors.white;

  // Background Colors
  static const Color backgroundPrimary = backgroundLight;
  static const Color backgroundSecondary = Colors.white;
  static const Color backgroundCard = Colors.white;

  // Border Colors
  static const Color borderLight = Color(0xFFE2E8F0);
  static const Color borderMedium = primaryLight;
  static const Color borderDark = primaryMedium;

  // Shadow Colors
  static const Color shadowLight = Color(0x1A324E7B);
  static const Color shadowMedium = Color(0x33324E7B);
  static const Color shadowDark = Color(0x4D324E7B);
}
