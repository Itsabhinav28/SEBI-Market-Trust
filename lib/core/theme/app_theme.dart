import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../constants/app_colors.dart';

class AppTheme {
  // Color Scheme - Updated with new professional colors
  static const Color primaryColor = AppColors.primaryDark;
  static const Color secondaryColor = AppColors.primaryLight;
  static const Color accentColor = AppColors.primaryMedium;
  static const Color successColor = AppColors.success;
  static const Color errorColor = AppColors.error;
  static const Color warningColor = AppColors.warning;
  static const Color infoColor = AppColors.info;

  // Light Theme Colors
  static const Color lightBackground = AppColors.backgroundPrimary;
  static const Color lightSurface = AppColors.backgroundSecondary;
  static const Color lightPrimary = AppColors.primaryDark;
  static const Color lightOnPrimary = AppColors.textOnDark;
  static const Color lightSecondary = AppColors.primaryLight;
  static const Color lightOnSecondary = AppColors.textOnDark;
  static const Color lightError = AppColors.error;
  static const Color lightOnError = AppColors.textOnDark;
  static const Color lightOnBackground = AppColors.textPrimary;
  static const Color lightOnSurface = AppColors.textPrimary;
  static const Color lightOutline = AppColors.borderLight;

  // Dark Theme Colors
  static const Color darkBackground = Color(0xFF1C1B1F);
  static const Color darkSurface = Color(0xFF2F2F2F);
  static const Color darkPrimary = Color(0xFF90CAF9);
  static const Color darkOnPrimary = Color(0xFF0D47A1);
  static const Color darkSecondary = Color(0xFF81D4FA);
  static const Color darkOnSecondary = Color(0xFF01579B);
  static const Color darkError = Color(0xFFEF5350);
  static const Color darkOnError = Color(0xFFB71C1C);
  static const Color darkOnBackground = Color(0xFFE6E1E5);
  static const Color darkOnSurface = Color(0xFFE6E1E5);
  static const Color darkOutline = Color(0xFF938F99);

  // Light Theme
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        surface: lightSurface,
        primary: lightPrimary,
        onPrimary: lightOnPrimary,
        secondary: lightSecondary,
        onSecondary: lightOnSecondary,
        error: lightError,
        onError: lightOnError,
        onSurface: lightOnSurface,
        outline: lightOutline,
      ),
      textTheme: _buildTextTheme(Colors.black87),
      primaryTextTheme: _buildTextTheme(Colors.white),
      appBarTheme: _buildAppBarTheme(lightPrimary, Colors.white),
      elevatedButtonTheme: _buildElevatedButtonTheme(),
      outlinedButtonTheme: _buildOutlinedButtonTheme(),
      textButtonTheme: _buildTextButtonTheme(),
      inputDecorationTheme: _buildInputDecorationTheme(),
      cardTheme: _buildCardTheme(),
      bottomNavigationBarTheme: _buildBottomNavigationBarTheme(),
      floatingActionButtonTheme: _buildFloatingActionButtonTheme(),
      iconTheme: const IconThemeData(color: lightPrimary),
      dividerTheme: const DividerThemeData(color: lightOutline),
      scaffoldBackgroundColor: lightBackground,
    );
  }

  // Dark Theme
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        surface: darkSurface,
        primary: darkPrimary,
        onPrimary: darkOnPrimary,
        secondary: darkSecondary,
        onSecondary: darkOnSecondary,
        error: darkError,
        onError: darkOnError,
        onSurface: darkOnSurface,
        outline: darkOutline,
      ),
      textTheme: _buildTextTheme(Colors.white70),
      primaryTextTheme: _buildTextTheme(Colors.black87),
      appBarTheme: _buildAppBarTheme(darkPrimary, Colors.black87),
      elevatedButtonTheme: _buildElevatedButtonTheme(),
      outlinedButtonTheme: _buildOutlinedButtonTheme(),
      textButtonTheme: _buildTextButtonTheme(),
      inputDecorationTheme: _buildInputDecorationTheme(),
      cardTheme: _buildCardTheme(),
      bottomNavigationBarTheme: _buildBottomNavigationBarTheme(),
      floatingActionButtonTheme: _buildFloatingActionButtonTheme(),
      iconTheme: const IconThemeData(color: darkPrimary),
      dividerTheme: const DividerThemeData(color: darkOutline),
      scaffoldBackgroundColor: darkBackground,
    );
  }

  // Text Theme Builder
  static TextTheme _buildTextTheme(Color color) {
    return TextTheme(
      displayLarge: TextStyle(
        fontSize: 57,
        fontWeight: FontWeight.w400,
        color: color,
      ),
      displayMedium: TextStyle(
        fontSize: 45,
        fontWeight: FontWeight.w400,
        color: color,
      ),
      displaySmall: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w400,
        color: color,
      ),
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w400,
        color: color,
      ),
      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w400,
        color: color,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: color,
      ),
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        color: color,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: color,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: color,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: color,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: color,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: color,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: color,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: color,
      ),
      labelSmall: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: color,
      ),
    );
  }

  // App Bar Theme
  static AppBarTheme _buildAppBarTheme(
      Color backgroundColor, Color foregroundColor) {
    return AppBarTheme(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      elevation: 4,
      shadowColor: Colors.black.withValues(alpha: 0.1),
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: foregroundColor,
      ),
      iconTheme: IconThemeData(color: foregroundColor),
      surfaceTintColor: Colors.transparent,
    );
  }

  // Elevated Button Theme
  static ElevatedButtonThemeData _buildElevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 2,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
        ),
        textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // Outlined Button Theme
  static OutlinedButtonThemeData _buildOutlinedButtonTheme() {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
        ),
        textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // Text Button Theme
  static TextButtonThemeData _buildTextButtonTheme() {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // Input Decoration Theme
  static InputDecorationTheme _buildInputDecorationTheme() {
    return InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
        borderSide: const BorderSide(color: lightOutline),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
        borderSide: const BorderSide(color: lightOutline),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
        borderSide: const BorderSide(color: lightPrimary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
        borderSide: const BorderSide(color: lightError),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      labelStyle: TextStyle(
        fontSize: 16,
        color: lightOutline,
      ),
      hintStyle: TextStyle(
        fontSize: 16,
        color: lightOutline.withValues(alpha: 0.7),
      ),
    );
  }

  // Card Theme
  static CardTheme _buildCardTheme() {
    return CardTheme(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
      ),
      margin: const EdgeInsets.all(AppConstants.smallPadding),
    );
  }

  // Bottom Navigation Bar Theme
  static BottomNavigationBarThemeData _buildBottomNavigationBarTheme() {
    return const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: lightPrimary,
      unselectedItemColor: lightOutline,
      backgroundColor: lightSurface,
      elevation: 8,
    );
  }

  // Floating Action Button Theme
  static FloatingActionButtonThemeData _buildFloatingActionButtonTheme() {
    return const FloatingActionButtonThemeData(
      backgroundColor: lightPrimary,
      foregroundColor: Colors.white,
      elevation: 6,
    );
  }
}
