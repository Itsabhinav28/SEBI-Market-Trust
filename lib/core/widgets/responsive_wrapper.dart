import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class AppResponsiveWrapper extends StatelessWidget {
  final Widget child;
  final double? maxWidth;
  final double? minWidth;

  const AppResponsiveWrapper({
    super.key,
    required this.child,
    this.maxWidth,
    this.minWidth,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: maxWidth ?? AppConstants.desktopBreakpoint.toDouble(),
        minWidth: minWidth ?? AppConstants.mobileBreakpoint.toDouble(),
      ),
      child: child,
    );
  }
}

// Responsive helper extensions
extension ResponsiveExtensions on BuildContext {
  bool get isMobile =>
      MediaQuery.of(this).size.width < AppConstants.tabletBreakpoint;
  bool get isTablet =>
      MediaQuery.of(this).size.width >= AppConstants.tabletBreakpoint &&
      MediaQuery.of(this).size.width < AppConstants.desktopBreakpoint;
  bool get isDesktop =>
      MediaQuery.of(this).size.width >= AppConstants.desktopBreakpoint;

  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;

  // Responsive padding
  EdgeInsets get responsivePadding {
    if (isMobile) {
      return const EdgeInsets.all(AppConstants.smallPadding);
    } else if (isTablet) {
      return const EdgeInsets.all(AppConstants.defaultPadding);
    } else {
      return const EdgeInsets.all(AppConstants.largePadding);
    }
  }

  // Responsive margin
  EdgeInsets get responsiveMargin {
    if (isMobile) {
      return const EdgeInsets.all(AppConstants.smallPadding);
    } else if (isTablet) {
      return const EdgeInsets.all(AppConstants.defaultPadding);
    } else {
      return const EdgeInsets.all(AppConstants.largePadding);
    }
  }

  // Responsive font size
  double getResponsiveFontSize({
    required double mobile,
    required double tablet,
    required double desktop,
  }) {
    if (isMobile) return mobile;
    if (isTablet) return tablet;
    return desktop;
  }

  // Responsive spacing
  double getResponsiveSpacing({
    required double mobile,
    required double tablet,
    required double desktop,
  }) {
    if (isMobile) return mobile;
    if (isTablet) return tablet;
    return desktop;
  }
}
