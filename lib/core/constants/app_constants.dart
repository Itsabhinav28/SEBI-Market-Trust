class AppConstants {
  // App Information
  static const String appName = 'SEBI MarketTrust';
  static const String appVersion = '1.0.0';
  static const String appDescription = 'Your trusted financial companion';

  // API Constants
  static const String baseUrl = 'https://api.sebimarkettrust.com';
  static const String apiVersion = '/v1';
  static const int connectionTimeout = 30000;
  static const int receiveTimeout = 30000;

  // Storage Keys
  static const String userTokenKey = 'user_token';
  static const String userProfileKey = 'user_profile';
  static const String themeKey = 'app_theme';
  static const String languageKey = 'app_language';

  // Animation Durations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 300);
  static const Duration longAnimation = Duration(milliseconds: 500);

  // Sizes
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;
  static const double defaultRadius = 12.0;
  static const double smallRadius = 8.0;
  static const double largeRadius = 16.0;

  // Colors
  static const int primaryColorValue = 0xFF1976D2;
  static const int secondaryColorValue = 0xFF42A5F5;
  static const int accentColorValue = 0xFFFF9800;
  static const int successColorValue = 0xFF4CAF50;
  static const int errorColorValue = 0xFFF44336;
  static const int warningColorValue = 0xFFFFC107;
  static const int infoColorValue = 0xFF2196F3;

  // Font Sizes
  static const double smallTextSize = 12.0;
  static const double normalTextSize = 14.0;
  static const double mediumTextSize = 16.0;
  static const double largeTextSize = 18.0;
  static const double titleTextSize = 24.0;
  static const double headlineTextSize = 32.0;

  // Breakpoints
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 900;
  static const double desktopBreakpoint = 1200;
}

