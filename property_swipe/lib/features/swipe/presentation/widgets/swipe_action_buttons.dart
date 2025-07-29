import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';

class SwipeActionButtons extends StatelessWidget {
  final VoidCallback onPassTap;
  final VoidCallback onLikeTap;
  final VoidCallback onSuperLikeTap;

  const SwipeActionButtons({
    super.key,
    required this.onPassTap,
    required this.onLikeTap,
    required this.onSuperLikeTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.contentPaddingXL,
        vertical: AppDimensions.spacingM,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Pass Button
          _buildActionButton(
            icon: Icons.close,
            color: AppColors.swipeLeft,
            size: AppDimensions.iconXL,
            onTap: onPassTap,
            tooltip: 'Pass',
          ),
          
          // Super Like Button
          _buildActionButton(
            icon: Icons.star,
            color: AppColors.swipeSuper,
            size: AppDimensions.iconL,
            onTap: onSuperLikeTap,
            tooltip: 'Super Like',
          ),
          
          // Like Button
          _buildActionButton(
            icon: Icons.favorite,
            color: AppColors.swipeRight,
            size: AppDimensions.iconXL,
            onTap: onLikeTap,
            tooltip: 'Like',
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required Color color,
    required double size,
    required VoidCallback onTap,
    required String tooltip,
  }) {
    final buttonSize = size + AppDimensions.spacingL;
    
    return Tooltip(
      message: tooltip,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(buttonSize / 2),
          child: Container(
            width: buttonSize,
            height: buttonSize,
            decoration: BoxDecoration(
              color: AppColors.background,
              shape: BoxShape.circle,
              border: Border.all(
                color: color,
                width: 3.0,
              ),
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.3),
                  blurRadius: 8.0,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(
              icon,
              color: color,
              size: size,
            ),
          ),
        ),
      ),
    );
  }
}

/// Alternative floating action buttons for swipe actions
class FloatingSwipeButtons extends StatelessWidget {
  final VoidCallback onPassTap;
  final VoidCallback onLikeTap;
  final VoidCallback onSuperLikeTap;

  const FloatingSwipeButtons({
    super.key,
    required this.onPassTap,
    required this.onLikeTap,
    required this.onSuperLikeTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Pass Button (Left)
        Positioned(
          left: AppDimensions.spacingXL,
          bottom: AppDimensions.spacingXXL,
          child: _buildFloatingButton(
            icon: Icons.close,
            color: AppColors.swipeLeft,
            onTap: onPassTap,
          ),
        ),
        
        // Super Like Button (Center)
        Positioned(
          left: MediaQuery.of(context).size.width / 2 - 28,
          bottom: AppDimensions.spacingXXL + 20,
          child: _buildFloatingButton(
            icon: Icons.star,
            color: AppColors.swipeSuper,
            onTap: onSuperLikeTap,
            size: AppDimensions.iconL,
          ),
        ),
        
        // Like Button (Right)
        Positioned(
          right: AppDimensions.spacingXL,
          bottom: AppDimensions.spacingXXL,
          child: _buildFloatingButton(
            icon: Icons.favorite,
            color: AppColors.swipeRight,
            onTap: onLikeTap,
          ),
        ),
      ],
    );
  }

  Widget _buildFloatingButton({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
    double size = AppDimensions.iconL,
  }) {
    return FloatingActionButton(
      onPressed: onTap,
      backgroundColor: color,
      foregroundColor: AppColors.textOnPrimary,
      elevation: 6.0,
      child: Icon(icon, size: size),
    );
  }
}