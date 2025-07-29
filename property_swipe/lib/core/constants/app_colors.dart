import 'package:flutter/material.dart';

/// PropertySwipe App Color Palette
/// Following the design system specifications for a modern, 
/// energetic, and trustworthy real estate app
class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFFFF6B6B);  // Coral Red - energetic and approachable
  static const Color primaryDark = Color(0xFFE55555);
  static const Color primaryLight = Color(0xFFFF8A8A);
  
  // Secondary Colors  
  static const Color secondary = Color(0xFF4ECDC4);  // Teal - trustworthy and modern
  static const Color secondaryDark = Color(0xFF3BA69F);
  static const Color secondaryLight = Color(0xFF6FD4CD);
  
  // Accent Colors
  static const Color accent = Color(0xFF45B7D1);  // Sky Blue - professional
  static const Color accentDark = Color(0xFF3A9BC1);
  static const Color accentLight = Color(0xFF5FC3D8);
  
  // Surface Colors
  static const Color background = Color(0xFFFFFFFF);  // White - clean
  static const Color surface = Color(0xFFF8F9FA);    // Light Gray - subtle
  static const Color surfaceDark = Color(0xFFE9ECEF);
  
  // Text Colors
  static const Color textPrimary = Color(0xFF212529);
  static const Color textSecondary = Color(0xFF6C757D);
  static const Color textTertiary = Color(0xFF868E96);
  static const Color textOnPrimary = Color(0xFFFFFFFF);
  static const Color textOnDark = Color(0xFFFFFFFF);
  
  // Status Colors
  static const Color success = Color(0xFF28A745);
  static const Color warning = Color(0xFFFFC107);
  static const Color error = Color(0xFFE74C3C);  // Red - clear error indication
  static const Color info = Color(0xFF17A2B8);
  
  // Swipe Action Colors
  static const Color swipeRight = Color(0xFF4CAF50);  // Green for like
  static const Color swipeLeft = Color(0xFFF44336);   // Red for pass
  static const Color swipeSuper = Color(0xFF2196F3);  // Blue for super like
  
  // Card Colors
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color cardShadow = Color(0x1A000000);
  static const Color cardBorder = Color(0xFFE0E0E0);
  
  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, primaryDark],
  );
  
  static const LinearGradient secondaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [secondary, secondaryDark],
  );
  
  static const LinearGradient accentGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [accent, accentDark],
  );
  
  // Overlay Colors
  static const Color overlay = Color(0x80000000);
  static const Color overlayLight = Color(0x40000000);
  static const Color shimmerBase = Color(0xFFE0E0E0);
  static const Color shimmerHighlight = Color(0xFFF5F5F5);
  
  // Property Type Colors
  static const Map<String, Color> propertyTypeColors = {
    '1BHK': Color(0xFF9C27B0),
    '2BHK': Color(0xFF673AB7),
    '3BHK': Color(0xFF3F51B5),
    '4BHK': Color(0xFF2196F3),
    'house': Color(0xFF009688),
    'commercial': Color(0xFF795548),
  };
  
  // App-specific color methods
  static Color getPropertyTypeColor(String propertyType) {
    return propertyTypeColors[propertyType] ?? primary;
  }
  
  static Color getSwipeActionColor(String action) {
    switch (action.toLowerCase()) {
      case 'right':
      case 'like':
        return swipeRight;
      case 'left':
      case 'pass':
        return swipeLeft;
      case 'super':
      case 'superlike':
        return swipeSuper;
      default:
        return textSecondary;
    }
  }
}