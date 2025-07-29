/// PropertySwipe App Dimension Constants
/// Following the 8px base unit spacing system for consistent UI
class AppDimensions {
  // Base Unit
  static const double baseUnit = 8.0;
  
  // Spacing
  static const double spacingXS = 4.0;   // baseUnit / 2
  static const double spacingS = 8.0;    // baseUnit
  static const double spacingM = 16.0;   // baseUnit * 2
  static const double spacingL = 24.0;   // baseUnit * 3
  static const double spacingXL = 32.0;  // baseUnit * 4
  static const double spacingXXL = 40.0; // baseUnit * 5
  
  // Card Dimensions (Swipe Interface)
  static const double cardWidthRatio = 0.9;  // 90% of screen width
  static const double cardHeightRatio = 0.7; // 70% of screen height
  static const double cardImageHeightRatio = 0.6; // 60% of card height
  static const double cardRadius = 16.0;
  static const double cardElevation = 8.0;
  
  // Border Radius
  static const double radiusXS = 4.0;
  static const double radiusS = 8.0;
  static const double radiusM = 12.0;
  static const double radiusL = 16.0;
  static const double radiusXL = 20.0;
  static const double radiusXXL = 24.0;
  static const double radiusCircular = 50.0;
  
  // Button Dimensions
  static const double buttonHeight = 48.0;
  static const double buttonHeightS = 36.0;
  static const double buttonHeightL = 56.0;
  static const double buttonRadius = 12.0;
  static const double buttonPadding = 16.0;
  
  // Icon Sizes
  static const double iconXS = 16.0;
  static const double iconS = 20.0;
  static const double iconM = 24.0;
  static const double iconL = 32.0;
  static const double iconXL = 40.0;
  static const double iconXXL = 48.0;
  
  // Avatar Sizes
  static const double avatarS = 32.0;
  static const double avatarM = 48.0;
  static const double avatarL = 64.0;
  static const double avatarXL = 80.0;
  
  // Swipe Gesture Thresholds
  static const double swipeThresholdHorizontal = 0.3; // 30% of screen width
  static const double swipeThresholdVertical = 0.2;   // 20% of screen height
  static const double swipeVelocityThreshold = 300.0;
  
  // Content Padding
  static const double contentPadding = 16.0;
  static const double contentPaddingS = 12.0;
  static const double contentPaddingL = 20.0;
  static const double contentPaddingXL = 24.0;
  
  // App Bar
  static const double appBarHeight = 56.0;
  static const double appBarElevation = 0.0;
  
  // Bottom Navigation
  static const double bottomNavHeight = 60.0;
  static const double bottomNavIconSize = 24.0;
  
  // List Items
  static const double listItemHeight = 72.0;
  static const double listItemHeightS = 56.0;
  static const double listItemHeightL = 88.0;
  
  // Input Fields
  static const double inputHeight = 48.0;
  static const double inputRadius = 8.0;
  static const double inputBorderWidth = 1.0;
  
  // Shadows
  static const double shadowBlurRadius = 8.0;
  static const double shadowSpreadRadius = 0.0;
  static const double shadowOffsetY = 2.0;
  
  // Animation Durations (in milliseconds)
  static const int animationFast = 200;
  static const int animationMedium = 300;
  static const int animationSlow = 500;
  static const int swipeAnimationDuration = 250;
  
  // Image Dimensions
  static const double imageRadius = 8.0;
  static const double propertyImageAspectRatio = 16 / 9;
  static const double profileImageSize = 100.0;
  
  // Carousel
  static const double carouselIndicatorSize = 8.0;
  static const double carouselIndicatorActiveSize = 12.0;
  static const double carouselIndicatorSpacing = 4.0;
  
  // Chat
  static const double chatBubbleRadius = 18.0;
  static const double chatBubblePadding = 12.0;
  static const double chatInputHeight = 50.0;
  
  // Modal and Dialog
  static const double modalRadius = 16.0;
  static const double modalPadding = 24.0;
  static const double dialogMaxWidth = 400.0;
  
  // Breakpoints for Responsive Design
  static const double mobileBreakpoint = 480.0;
  static const double tabletBreakpoint = 768.0;
  static const double desktopBreakpoint = 1024.0;
  
  // Loading
  static const double loadingIndicatorSize = 24.0;
  static const double loadingOverlayOpacity = 0.7;
  
  // Property Card Specific
  static const double propertyCardMinHeight = 400.0;
  static const double propertyCardMaxHeight = 600.0;
  static const double propertyImageHeight = 250.0;
  static const double propertyInfoHeight = 120.0;
  
  // Swipe Action Overlay
  static const double swipeOverlayIconSize = 80.0;
  static const double swipeOverlayOpacity = 0.8;
}

/// Screen size helper class
class ScreenSizes {
  static bool isMobile(double width) => width < AppDimensions.mobileBreakpoint;
  static bool isTablet(double width) => width >= AppDimensions.mobileBreakpoint && 
                                       width < AppDimensions.desktopBreakpoint;
  static bool isDesktop(double width) => width >= AppDimensions.desktopBreakpoint;
  
  static double getResponsivePadding(double screenWidth) {
    if (isMobile(screenWidth)) return AppDimensions.contentPadding;
    if (isTablet(screenWidth)) return AppDimensions.contentPaddingL;
    return AppDimensions.contentPaddingXL;
  }
}