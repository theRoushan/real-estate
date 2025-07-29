import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../models/property_listing.dart';
import '../widgets/property_card.dart';
import '../widgets/swipe_action_buttons.dart';
import '../widgets/swipe_overlay.dart';
import '../providers/swipe_providers.dart';

class SwipePage extends ConsumerStatefulWidget {
  const SwipePage({super.key});

  @override
  ConsumerState<SwipePage> createState() => _SwipePageState();
}

class _SwipePageState extends ConsumerState<SwipePage> {
  final CardSwiperController _cardController = CardSwiperController();

  @override
  Widget build(BuildContext context) {
    final swipeState = ref.watch(swipeProvider);
    final swipeNotifier = ref.read(swipeProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('PropertySwipe'),
        actions: [
          IconButton(
            icon: const Icon(Icons.tune),
            onPressed: () {
              // TODO: Open filters
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              // TODO: Open profile
            },
          ),
        ],
      ),
      body: SafeArea(
        child: _buildBody(swipeState, swipeNotifier),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  /// Build the main body based on state
  Widget _buildBody(SwipeState state, SwipeNotifier notifier) {
    if (state.isLoading && state.properties.isEmpty) {
      return _buildLoadingState();
    }
    
    if (state.error != null && state.properties.isEmpty) {
      return _buildErrorState(state.error!, notifier);
    }
    
    if (state.properties.isEmpty) {
      return _buildEmptyState();
    }
    
    return _buildSwipeInterface(state, notifier);
  }
  
  /// Build loading state
  Widget _buildLoadingState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: AppDimensions.spacingL),
          Text(
            'Loading properties...',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
  
  /// Build error state
  Widget _buildErrorState(String error, SwipeNotifier notifier) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            size: 80,
            color: AppColors.error,
          ),
          const SizedBox(height: AppDimensions.spacingL),
          Text(
            error,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingL),
          ElevatedButton(
            onPressed: () => notifier.refreshProperties(),
            child: const Text('Try Again'),
          ),
        ],
      ),
    );
  }
  
  /// Build the main swipe interface
  Widget _buildSwipeInterface(SwipeState state, SwipeNotifier notifier) {
    final visibleProperties = state.properties.skip(state.currentIndex).take(3).toList();
    
    return Column(
      children: [
        // Card Swiper Area
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(AppDimensions.spacingM),
            child: CardSwiper(
              controller: _cardController,
              cardsCount: visibleProperties.length,
              numberOfCardsDisplayed: 3,
              allowedSwipeDirection: const AllowedSwipeDirection.symmetric(
                horizontal: true,
                vertical: true,
              ),
              cardBuilder: (context, index, horizontalThresholdPercentage, verticalThresholdPercentage) {
                return Stack(
                  children: [
                    PropertyCard(property: visibleProperties[index]),
                    
                    // Swipe Overlay
                    SwipeOverlay(
                      horizontalThreshold: horizontalThresholdPercentage.toDouble(),
                      verticalThreshold: verticalThresholdPercentage.toDouble(),
                    ),
                  ],
                );
              },
              onSwipe: (previousIndex, currentIndex, direction) => _onSwipe(
                visibleProperties[previousIndex],
                direction,
                notifier,
              ),
              onUndo: _onUndo,
              duration: const Duration(milliseconds: AppDimensions.swipeAnimationDuration),
              scale: 0.9,
              threshold: 50,
            ),
          ),
        ),
        
        // Action Buttons
        SwipeActionButtons(
          onPassTap: () => _handleSwipe(CardSwiperDirection.left, notifier),
          onLikeTap: () => _handleSwipe(CardSwiperDirection.right, notifier),
          onSuperLikeTap: () => _handleSwipe(CardSwiperDirection.top, notifier),
        ),
        
        const SizedBox(height: AppDimensions.spacingL),
      ],
    );
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.home_outlined,
            size: 80,
            color: AppColors.textTertiary,
          ),
          SizedBox(height: AppDimensions.spacingL),
          Text(
            'No more properties',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
            ),
          ),
          SizedBox(height: AppDimensions.spacingS),
          Text(
            'Check back later for new listings',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.textTertiary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: 0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Discover',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Matches',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'Messages',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      onTap: (index) {
        // TODO: Implement navigation
        switch (index) {
          case 0:
            // Already on discover page
            break;
          case 1:
            // Navigate to matches
            break;
          case 2:
            // Navigate to messages
            break;
          case 3:
            // Navigate to profile
            break;
        }
      },
    );
  }

  void _handleSwipe(CardSwiperDirection direction, SwipeNotifier notifier) {
    _cardController.swipe(direction);
  }

  bool _onSwipe(
    PropertyListing property,
    CardSwiperDirection direction,
    SwipeNotifier notifier,
  ) {
    // Handle swipe action with backend integration
    switch (direction) {
      case CardSwiperDirection.left:
        _handlePropertyAction(property, SwipeAction.left, notifier);
        break;
      case CardSwiperDirection.right:
        _handlePropertyAction(property, SwipeAction.right, notifier);
        break;
      case CardSwiperDirection.top:
        _handlePropertyAction(property, SwipeAction.superLike, notifier);
        break;
      case CardSwiperDirection.bottom:
      case CardSwiperDirection.none:
        // Not used in our case
        break;
    }
    
    return true;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    // Handle undo action
    debugPrint('Undo swipe: $direction');
    return true;
  }

  /// Handle property action with backend integration
  void _handlePropertyAction(
    PropertyListing property,
    SwipeAction action,
    SwipeNotifier notifier,
  ) {
    // Record swipe with backend
    notifier.handleSwipe(
      propertyId: property.propertyId,
      action: action,
    );
    
    // Show feedback to user
    switch (action) {
      case SwipeAction.left:
        _showSwipeSnackbar('Passed', Icons.close, AppColors.swipeLeft);
        break;
      case SwipeAction.right:
        _showSwipeSnackbar('Liked', Icons.favorite, AppColors.swipeRight);
        break;
      case SwipeAction.superLike:
        _showSwipeSnackbar('Super Liked!', Icons.star, AppColors.swipeUp);
        break;
    }
  }

  void _showSwipeSnackbar(String message, IconData icon, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: color),
            const SizedBox(width: AppDimensions.spacingS),
            Text(message),
          ],
        ),
        duration: const Duration(milliseconds: 1000),
      ),
    );
  }
}

// Mock data generator - will be replaced with real data
List<PropertyListing> _generateMockProperties() {
  return [
    PropertyListing(
      propertyId: '1',
      basicInfo: const BasicInfo(
        title: 'Spacious 2BHK in Koramangala',
        description: 'Beautiful apartment with modern amenities, fully furnished, and excellent connectivity.',
        price: 35000,
        propertyType: PropertyType.twoBhk,
        listingType: ListingType.rent,
        area: 1200,
        furnishingStatus: FurnishingStatus.fullyFurnished,
      ),
      location: const PropertyLocation(
        address: '123 Main Street, Koramangala',
        area: 'Koramangala',
        city: 'Bangalore',
        pincode: '560034',
        coordinates: Coordinates(latitude: 12.9279, longitude: 77.6271),
      ),
      media: const PropertyMedia(
        images: [
          'https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=800',
          'https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=800',
        ],
        primaryImage: 'https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=800',
      ),
      ownerInfo: const OwnerInfo(
        ownerId: 'owner1',
        contactPhone: '+91 9876543210',
        contactEmail: 'owner@example.com',
        responseTime: 'Within 1 hour',
      ),
      availability: PropertyAvailability(
        availableFrom: DateTime.now(),
        status: PropertyStatus.active,
      ),
      metadata: PropertyMetadata(
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        views: 45,
        rightSwipes: 12,
        leftSwipes: 8,
      ),
    ),
    PropertyListing(
      propertyId: '2',
      basicInfo: const BasicInfo(
        title: 'Luxury 3BHK in Whitefield',
        description: 'Premium apartment with swimming pool, gym, and 24/7 security. Perfect for families.',
        price: 55000,
        propertyType: PropertyType.threeBhk,
        listingType: ListingType.rent,
        area: 1800,
        furnishingStatus: FurnishingStatus.semiFurnished,
      ),
      location: const PropertyLocation(
        address: '456 Tech Park Road, Whitefield',
        area: 'Whitefield',
        city: 'Bangalore',
        pincode: '560066',
        coordinates: Coordinates(latitude: 12.9698, longitude: 77.7500),
      ),
      media: const PropertyMedia(
        images: [
          'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800',
          'https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=800',
        ],
        primaryImage: 'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800',
      ),
      ownerInfo: const OwnerInfo(
        ownerId: 'owner2',
        contactPhone: '+91 9876543211',
        contactEmail: 'owner2@example.com',
        responseTime: 'Within 2 hours',
      ),
      availability: PropertyAvailability(
        availableFrom: DateTime.now().add(const Duration(days: 15)),
        status: PropertyStatus.active,
      ),
      metadata: PropertyMetadata(
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
        updatedAt: DateTime.now(),
        views: 78,
        rightSwipes: 23,
        leftSwipes: 15,
      ),
    ),
    PropertyListing(
      propertyId: '3',
      basicInfo: const BasicInfo(
        title: 'Cozy 1BHK near Metro',
        description: 'Perfect for young professionals. Walking distance to metro station and IT parks.',
        price: 22000,
        propertyType: PropertyType.oneBhk,
        listingType: ListingType.rent,
        area: 650,
        furnishingStatus: FurnishingStatus.fullyFurnished,
      ),
      location: const PropertyLocation(
        address: '789 Metro Plaza, Electronic City',
        area: 'Electronic City',
        city: 'Bangalore',
        pincode: '560100',
        coordinates: Coordinates(latitude: 12.8456, longitude: 77.6603),
      ),
      media: const PropertyMedia(
        images: [
          'https://images.unsplash.com/photo-1484154218962-a197022b5858?w=800',
          'https://images.unsplash.com/photo-1493809842364-78817add7ffb?w=800',
        ],
        primaryImage: 'https://images.unsplash.com/photo-1484154218962-a197022b5858?w=800',
      ),
      ownerInfo: const OwnerInfo(
        ownerId: 'owner3',
        contactPhone: '+91 9876543212',
        contactEmail: 'owner3@example.com',
        responseTime: 'Within 30 minutes',
      ),
      availability: PropertyAvailability(
        availableFrom: DateTime.now().add(const Duration(days: 7)),
        status: PropertyStatus.active,
      ),
      metadata: PropertyMetadata(
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        updatedAt: DateTime.now(),
        views: 92,
        rightSwipes: 28,
        leftSwipes: 19,
      ),
    ),
  ];
}