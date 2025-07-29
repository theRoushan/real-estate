import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';

class SwipeOverlay extends StatelessWidget {
  final double horizontalThreshold;
  final double verticalThreshold;

  const SwipeOverlay({
    super.key,
    required this.horizontalThreshold,
    required this.verticalThreshold,
  });

  @override
  Widget build(BuildContext context) {
    // Determine the swipe direction and intensity
    final SwipeDirection direction = _getSwipeDirection();
    final double intensity = _getSwipeIntensity();
    
    if (direction == SwipeDirection.none || intensity < 0.1) {
      return const SizedBox.shrink();
    }
    
    return AnimatedOpacity(
      opacity: intensity.clamp(0.0, AppDimensions.swipeOverlayOpacity),
      duration: const Duration(milliseconds: 100),
      child: Container(
        decoration: BoxDecoration(
          color: _getOverlayColor(direction),
          borderRadius: BorderRadius.circular(AppDimensions.cardRadius),
        ),
        child: _buildOverlayContent(direction, intensity),
      ),
    );
  }

  SwipeDirection _getSwipeDirection() {
    // Check vertical swipe first (super like)
    if (verticalThreshold < -0.15) {
      return SwipeDirection.up;
    }
    
    // Check horizontal swipes
    if (horizontalThreshold > 0.15) {
      return SwipeDirection.right;
    } else if (horizontalThreshold < -0.15) {
      return SwipeDirection.left;
    }
    
    return SwipeDirection.none;
  }

  double _getSwipeIntensity() {
    final double maxThreshold = 0.5; // Maximum threshold for full intensity
    
    switch (_getSwipeDirection()) {
      case SwipeDirection.left:
        return (-horizontalThreshold / maxThreshold).clamp(0.0, 1.0);
      case SwipeDirection.right:
        return (horizontalThreshold / maxThreshold).clamp(0.0, 1.0);
      case SwipeDirection.up:
        return (-verticalThreshold / maxThreshold).clamp(0.0, 1.0);
      case SwipeDirection.none:
        return 0.0;
    }
  }

  Color _getOverlayColor(SwipeDirection direction) {
    switch (direction) {
      case SwipeDirection.left:
        return AppColors.swipeLeft.withOpacity(0.2);
      case SwipeDirection.right:
        return AppColors.swipeRight.withOpacity(0.2);
      case SwipeDirection.up:
        return AppColors.swipeSuper.withOpacity(0.2);
      case SwipeDirection.none:
        return Colors.transparent;
    }
  }

  Widget _buildOverlayContent(SwipeDirection direction, double intensity) {
    final IconData icon;
    final String text;
    final Color color;
    
    switch (direction) {
      case SwipeDirection.left:
        icon = Icons.close;
        text = 'PASS';
        color = AppColors.swipeLeft;
        break;
      case SwipeDirection.right:
        icon = Icons.favorite;
        text = 'LIKE';
        color = AppColors.swipeRight;
        break;
      case SwipeDirection.up:
        icon = Icons.star;
        text = 'SUPER LIKE';
        color = AppColors.swipeSuper;
        break;
      case SwipeDirection.none:
        return const SizedBox.shrink();
    }
    
    return Stack(
      children: [
        // Main overlay content
        Center(
          child: Transform.scale(
            scale: 0.8 + (0.4 * intensity), // Scale from 0.8 to 1.2
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(AppDimensions.spacingL),
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: color.withOpacity(0.4),
                        blurRadius: 16.0,
                        spreadRadius: 4.0,
                      ),
                    ],
                  ),
                  child: Icon(
                    icon,
                    size: AppDimensions.swipeOverlayIconSize,
                    color: AppColors.textOnPrimary,
                  ),
                ),
                const SizedBox(height: AppDimensions.spacingM),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.spacingL,
                    vertical: AppDimensions.spacingS,
                  ),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(AppDimensions.radiusL),
                  ),
                  child: Text(
                    text,
                    style: const TextStyle(
                      color: AppColors.textOnPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        
        // Corner indicators for better visual feedback
        if (direction == SwipeDirection.left) _buildCornerIndicator(
          alignment: Alignment.topLeft,
          color: color,
          icon: icon,
        ),
        if (direction == SwipeDirection.right) _buildCornerIndicator(
          alignment: Alignment.topRight,
          color: color,
          icon: icon,
        ),
        if (direction == SwipeDirection.up) _buildCornerIndicator(
          alignment: Alignment.topCenter,
          color: color,
          icon: icon,
        ),
      ],
    );
  }

  Widget _buildCornerIndicator({
    required Alignment alignment,
    required Color color,
    required IconData icon,
  }) {
    return Positioned.fill(
      child: Align(
        alignment: alignment,
        child: Container(
          margin: const EdgeInsets.all(AppDimensions.spacingL),
          padding: const EdgeInsets.all(AppDimensions.spacingS),
          decoration: BoxDecoration(
            color: color.withOpacity(0.9),
            borderRadius: BorderRadius.circular(AppDimensions.radiusS),
          ),
          child: Icon(
            icon,
            color: AppColors.textOnPrimary,
            size: AppDimensions.iconL,
          ),
        ),
      ),
    );
  }
}

enum SwipeDirection {
  none,
  left,
  right,
  up,
}

/// Alternative implementation with rotation effects
class SwipeOverlayWithRotation extends StatelessWidget {
  final double horizontalThreshold;
  final double verticalThreshold;

  const SwipeOverlayWithRotation({
    super.key,
    required this.horizontalThreshold,
    required this.verticalThreshold,
  });

  @override
  Widget build(BuildContext context) {
    final double rotation = horizontalThreshold * 0.3; // Rotation effect
    final SwipeDirection direction = _getSwipeDirection();
    final double intensity = _getSwipeIntensity();
    
    if (direction == SwipeDirection.none || intensity < 0.1) {
      return const SizedBox.shrink();
    }
    
    return Transform.rotate(
      angle: rotation,
      child: AnimatedOpacity(
        opacity: intensity.clamp(0.0, 0.8),
        duration: const Duration(milliseconds: 100),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                _getOverlayColor(direction),
                _getOverlayColor(direction).withOpacity(0.1),
              ],
            ),
            borderRadius: BorderRadius.circular(AppDimensions.cardRadius),
          ),
          child: _buildOverlayContent(direction, intensity),
        ),
      ),
    );
  }

  SwipeDirection _getSwipeDirection() {
    if (verticalThreshold < -0.15) return SwipeDirection.up;
    if (horizontalThreshold > 0.15) return SwipeDirection.right;
    if (horizontalThreshold < -0.15) return SwipeDirection.left;
    return SwipeDirection.none;
  }

  double _getSwipeIntensity() {
    final double maxThreshold = 0.5;
    
    switch (_getSwipeDirection()) {
      case SwipeDirection.left:
        return (-horizontalThreshold / maxThreshold).clamp(0.0, 1.0);
      case SwipeDirection.right:
        return (horizontalThreshold / maxThreshold).clamp(0.0, 1.0);
      case SwipeDirection.up:
        return (-verticalThreshold / maxThreshold).clamp(0.0, 1.0);
      case SwipeDirection.none:
        return 0.0;
    }
  }

  Color _getOverlayColor(SwipeDirection direction) {
    switch (direction) {
      case SwipeDirection.left:
        return AppColors.swipeLeft.withOpacity(0.3);
      case SwipeDirection.right:
        return AppColors.swipeRight.withOpacity(0.3);
      case SwipeDirection.up:
        return AppColors.swipeSuper.withOpacity(0.3);
      case SwipeDirection.none:
        return Colors.transparent;
    }
  }

  Widget _buildOverlayContent(SwipeDirection direction, double intensity) {
    // Similar implementation to the main SwipeOverlay
    return const Center(
      child: Icon(
        Icons.favorite,
        size: 100,
        color: AppColors.textOnPrimary,
      ),
    );
  }
}