import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/property_listing.dart';
import '../../../core/api/services/property_api_service.dart';
import '../../../core/api/dtos/property_dto.dart';
import '../../../core/exceptions/api_exception.dart';

/// State for property swipe functionality
@immutable
class SwipeState {
  final List<PropertyListing> properties;
  final bool isLoading;
  final String? error;
  final bool hasMore;
  final int currentIndex;
  final String? nextCursor;
  
  const SwipeState({
    this.properties = const [],
    this.isLoading = false,
    this.error,
    this.hasMore = true,
    this.currentIndex = 0,
    this.nextCursor,
  });
  
  SwipeState copyWith({
    List<PropertyListing>? properties,
    bool? isLoading,
    String? error,
    bool? hasMore,
    int? currentIndex,
    String? nextCursor,
  }) {
    return SwipeState(
      properties: properties ?? this.properties,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      hasMore: hasMore ?? this.hasMore,
      currentIndex: currentIndex ?? this.currentIndex,
      nextCursor: nextCursor ?? this.nextCursor,
    );
  }
}

/// Notifier for managing swipe state and backend integration
class SwipeNotifier extends StateNotifier<SwipeState> {
  final PropertyApiService _propertyApiService;
  
  SwipeNotifier(this._propertyApiService) : super(const SwipeState()) {
    _loadInitialProperties();
  }
  
  /// Load initial properties for swiping
  Future<void> _loadInitialProperties() async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      final response = await _propertyApiService.getPropertyFeed(
        page: 1,
        limit: 20,
      );
      
      state = state.copyWith(
        properties: response.properties,
        isLoading: false,
        hasMore: response.hasMore,
        nextCursor: response.nextCursor,
      );
    } catch (e) {
      String errorMessage = 'Failed to load properties';
      if (e is ApiException) {
        errorMessage = e.userFriendlyMessage;
      }
      
      state = state.copyWith(
        isLoading: false,
        error: errorMessage,
      );
    }
  }
  
  /// Load more properties when running low
  Future<void> loadMoreProperties() async {
    if (state.isLoading || !state.hasMore) return;
    
    try {
      final currentPage = (state.properties.length / 20).ceil() + 1;
      final response = await _propertyApiService.getPropertyFeed(
        page: currentPage,
        limit: 20,
      );
      
      state = state.copyWith(
        properties: [...state.properties, ...response.properties],
        hasMore: response.hasMore,
        nextCursor: response.nextCursor,
      );
    } catch (e) {
      // Silently fail for pagination errors
      print('Failed to load more properties: $e');
    }
  }
  
  /// Handle swipe action and send to backend
  Future<void> handleSwipe({
    required String propertyId,
    required SwipeAction action,
  }) async {
    try {
      // Record swipe in backend
      final response = await _propertyApiService.recordSwipe(
        propertyId: propertyId,
        action: action.name,
        metadata: {
          'timestamp': DateTime.now().toIso8601String(),
          'currentIndex': state.currentIndex,
        },
      );
      
      // Move to next property
      final nextIndex = state.currentIndex + 1;
      state = state.copyWith(currentIndex: nextIndex);
      
      // Load more properties if running low
      if (nextIndex >= state.properties.length - 5) {
        loadMoreProperties();
      }
      
      // Handle match if it occurred
      if (response.isMatch && response.matchId != null) {
        _handleNewMatch(response.matchId!);
      }
      
    } catch (e) {
      // For swipe errors, we'll continue but log the error
      print('Failed to record swipe: $e');
      
      // Still move to next property locally
      final nextIndex = state.currentIndex + 1;
      state = state.copyWith(currentIndex: nextIndex);
    }
  }
  
  /// Handle new match
  void _handleNewMatch(String matchId) {
    // TODO: Show match notification/dialog
    // TODO: Navigate to match screen
    print('New match created: $matchId');
  }
  
  /// Refresh properties (pull to refresh)
  Future<void> refreshProperties() async {
    state = state.copyWith(
      properties: [],
      currentIndex: 0,
      hasMore: true,
      nextCursor: null,
    );
    await _loadInitialProperties();
  }
  
  /// Get current property being shown
  PropertyListing? get currentProperty {
    if (state.currentIndex < state.properties.length) {
      return state.properties[state.currentIndex];
    }
    return null;
  }
  
  /// Get upcoming properties for preview
  List<PropertyListing> get upcomingProperties {
    final startIndex = state.currentIndex + 1;
    final endIndex = (startIndex + 3).clamp(0, state.properties.length);
    
    if (startIndex >= state.properties.length) {
      return [];
    }
    
    return state.properties.sublist(startIndex, endIndex);
  }
}

/// Swipe action enum
enum SwipeAction {
  left,
  right,
  superLike,
}

extension SwipeActionExtension on SwipeAction {
  String get name {
    switch (this) {
      case SwipeAction.left:
        return 'left';
      case SwipeAction.right:
        return 'right';
      case SwipeAction.superLike:
        return 'super';
    }
  }
}

/// Provider for swipe state management
final swipeProvider = StateNotifierProvider<SwipeNotifier, SwipeState>((ref) {
  final propertyApiService = ref.read(propertyApiServiceProvider);
  return SwipeNotifier(propertyApiService);
});

/// Provider for current property
final currentPropertyProvider = Provider<PropertyListing?>((ref) {
  final swipeState = ref.watch(swipeProvider);
  final swipeNotifier = ref.read(swipeProvider.notifier);
  return swipeNotifier.currentProperty;
});

/// Provider for upcoming properties
final upcomingPropertiesProvider = Provider<List<PropertyListing>>((ref) {
  final swipeNotifier = ref.read(swipeProvider.notifier);
  return swipeNotifier.upcomingProperties;
});