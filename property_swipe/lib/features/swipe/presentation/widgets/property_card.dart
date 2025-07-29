import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../models/property_listing.dart';

class PropertyCard extends StatelessWidget {
  final PropertyListing property;

  const PropertyCard({
    super.key,
    required this.property,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final cardHeight = screenSize.height * AppDimensions.cardHeightRatio;
    
    return Container(
      height: cardHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimensions.cardRadius),
        boxShadow: const [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: AppDimensions.shadowBlurRadius,
            offset: Offset(0, AppDimensions.shadowOffsetY),
            spreadRadius: AppDimensions.shadowSpreadRadius,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppDimensions.cardRadius),
        child: Stack(
          children: [
            // Property Image
            _buildPropertyImage(cardHeight),
            
            // Gradient Overlay
            _buildGradientOverlay(),
            
            // Property Information
            _buildPropertyInfo(),
            
            // Property Type Badge
            _buildPropertyTypeBadge(),
            
            // Listing Type Badge
            _buildListingTypeBadge(),
          ],
        ),
      ),
    );
  }

  Widget _buildPropertyImage(double cardHeight) {
    final imageHeight = cardHeight * AppDimensions.cardImageHeightRatio;
    
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SizedBox(
        height: imageHeight,
        child: CachedNetworkImage(
          imageUrl: property.media.primaryImage,
          fit: BoxFit.cover,
          placeholder: (context, url) => Container(
            color: AppColors.surface,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          errorWidget: (context, url, error) => Container(
            color: AppColors.surface,
            child: const Center(
              child: Icon(
                Icons.home_outlined,
                size: 50,
                color: AppColors.textTertiary,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGradientOverlay() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 200,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black54,
              Colors.black87,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPropertyInfo() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.contentPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Price
            Row(
              children: [
                Text(
                  '₹${_formatPrice(property.basicInfo.price)}',
                  style: AppTextStyles.propertyPrice.copyWith(
                    color: AppColors.textOnDark,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(width: AppDimensions.spacingS),
                Text(
                  property.basicInfo.listingType == ListingType.rent 
                      ? '/month' 
                      : '',
                  style: const TextStyle(
                    color: AppColors.textOnDark,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: AppDimensions.spacingS),
            
            // Title
            Text(
              property.basicInfo.title,
              style: AppTextStyles.propertyTitle.copyWith(
                color: AppColors.textOnDark,
                fontSize: 18,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            
            const SizedBox(height: AppDimensions.spacingXS),
            
            // Location
            Row(
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  color: AppColors.textOnDark,
                  size: 16,
                ),
                const SizedBox(width: AppDimensions.spacingXS),
                Expanded(
                  child: Text(
                    '${property.location.area}, ${property.location.city}',
                    style: AppTextStyles.propertyLocation.copyWith(
                      color: AppColors.textOnDark,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: AppDimensions.spacingS),
            
            // Property Details Row
            Row(
              children: [
                _buildDetailChip(
                  '${property.basicInfo.area.toInt()} sqft',
                  Icons.square_foot,
                ),
                const SizedBox(width: AppDimensions.spacingS),
                _buildDetailChip(
                  _getFurnishingText(property.basicInfo.furnishingStatus),
                  Icons.chair_outlined,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPropertyTypeBadge() {
    return Positioned(
      top: AppDimensions.spacingM,
      left: AppDimensions.spacingM,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.spacingS,
          vertical: AppDimensions.spacingXS,
        ),
        decoration: BoxDecoration(
          color: AppColors.getPropertyTypeColor(
            property.basicInfo.propertyType.name.toUpperCase(),
          ),
          borderRadius: BorderRadius.circular(AppDimensions.radiusS),
        ),
        child: Text(
          _getPropertyTypeText(property.basicInfo.propertyType),
          style: AppTextStyles.propertyType.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildListingTypeBadge() {
    return Positioned(
      top: AppDimensions.spacingM,
      right: AppDimensions.spacingM,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.spacingS,
          vertical: AppDimensions.spacingXS,
        ),
        decoration: BoxDecoration(
          color: property.basicInfo.listingType == ListingType.rent
              ? AppColors.secondary
              : AppColors.accent,
          borderRadius: BorderRadius.circular(AppDimensions.radiusS),
        ),
        child: Text(
          property.basicInfo.listingType == ListingType.rent
              ? 'FOR RENT'
              : 'FOR SALE',
          style: AppTextStyles.propertyType.copyWith(
            fontSize: 10,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _buildDetailChip(String text, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spacingS,
        vertical: AppDimensions.spacingXS,
      ),
      decoration: BoxDecoration(
        color: AppColors.overlayLight,
        borderRadius: BorderRadius.circular(AppDimensions.radiusS),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: AppColors.textOnDark,
            size: 14,
          ),
          const SizedBox(width: AppDimensions.spacingXS),
          Text(
            text,
            style: const TextStyle(
              color: AppColors.textOnDark,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  String _formatPrice(double price) {
    final formatter = NumberFormat('#,##,###');
    if (price >= 10000000) {
      return '${(price / 10000000).toStringAsFixed(1)}Cr';
    } else if (price >= 100000) {
      return '${(price / 100000).toStringAsFixed(1)}L';
    } else if (price >= 1000) {
      return '${(price / 1000).toStringAsFixed(1)}K';
    } else {
      return formatter.format(price);
    }
  }

  String _getPropertyTypeText(PropertyType type) {
    switch (type) {
      case PropertyType.oneBhk:
        return '1BHK';
      case PropertyType.twoBhk:
        return '2BHK';
      case PropertyType.threeBhk:
        return '3BHK';
      case PropertyType.fourBhk:
        return '4BHK';
      case PropertyType.house:
        return 'HOUSE';
      case PropertyType.commercial:
        return 'COMMERCIAL';
    }
  }

  String _getFurnishingText(FurnishingStatus status) {
    switch (status) {
      case FurnishingStatus.unfurnished:
        return 'Unfurnished';
      case FurnishingStatus.semiFurnished:
        return 'Semi-Furnished';
      case FurnishingStatus.fullyFurnished:
        return 'Fully Furnished';
    }
  }
}