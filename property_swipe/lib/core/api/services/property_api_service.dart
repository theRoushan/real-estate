import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api_client.dart';
import '../api_config.dart';
import '../dtos/property_dto.dart';
import '../../../models/property_listing.dart';

/// Service for property-related API calls
class PropertyApiService {
  final ApiClient _apiClient;
  
  PropertyApiService(this._apiClient);
  
  /// Get property feed for swiping
  Future<PropertyFeedResponse> getPropertyFeed({
    int page = 1,
    int limit = 20,
    double? minPrice,
    double? maxPrice,
    String? city,
    String? area,
    List<String>? propertyTypes,
    double? latitude,
    double? longitude,
    double? radiusKm,
  }) async {
    final queryParams = <String, dynamic>{
      'page': page,
      'limit': limit,
      if (minPrice != null) 'minPrice': minPrice,
      if (maxPrice != null) 'maxPrice': maxPrice,
      if (city != null) 'city': city,
      if (area != null) 'area': area,
      if (propertyTypes != null) 'propertyTypes': propertyTypes.join(','),
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (radiusKm != null) 'radiusKm': radiusKm,
    };
    
    final response = await _apiClient.get(
      ApiConfig.propertyFeed,
      queryParameters: queryParams,
    );
    
    return PropertyFeedResponse.fromJson(response.data);
  }
  
  /// Record a swipe action
  Future<SwipeResponse> recordSwipe({
    required String propertyId,
    required String action,
    Map<String, dynamic>? metadata,
  }) async {
    final request = SwipeRequest(
      propertyId: propertyId,
      action: action,
      timestamp: DateTime.now(),
      metadata: metadata,
    );
    
    final response = await _apiClient.post(
      ApiConfig.propertySwipe,
      data: request.toJson(),
    );
    
    return SwipeResponse.fromJson(response.data);
  }
  
  /// Get property details by ID
  Future<PropertyListing> getProperty(String propertyId) async {
    final response = await _apiClient.get(
      '${ApiConfig.properties}/$propertyId',
    );
    
    return PropertyListing.fromJson(response.data);
  }
  
  /// Create a new property listing
  Future<CreatePropertyResponse> createProperty(
    CreatePropertyRequest request,
  ) async {
    final response = await _apiClient.post(
      ApiConfig.properties,
      data: request.toJson(),
    );
    
    return CreatePropertyResponse.fromJson(response.data);
  }
  
  /// Update an existing property
  Future<PropertyListing> updateProperty(
    String propertyId,
    Map<String, dynamic> updates,
  ) async {
    final response = await _apiClient.put(
      '${ApiConfig.properties}/$propertyId',
      data: updates,
    );
    
    return PropertyListing.fromJson(response.data);
  }
  
  /// Delete a property
  Future<void> deleteProperty(String propertyId) async {
    await _apiClient.delete('${ApiConfig.properties}/$propertyId');
  }
  
  /// Upload property images
  Future<List<String>> uploadPropertyImages(
    List<String> imagePaths,
  ) async {
    // Convert string paths to File objects (this would need actual file handling)
    // For now, we'll return the paths as URLs
    // In a real implementation, you'd upload to Firebase Storage or backend
    return imagePaths;
  }
}

/// Provider for PropertyApiService
final propertyApiServiceProvider = Provider<PropertyApiService>((ref) {
  final apiClient = ref.read(apiClientProvider);
  return PropertyApiService(apiClient);
});