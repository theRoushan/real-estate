import 'package:json_annotation/json_annotation.dart';
import '../../../models/property_listing.dart';

part 'property_dto.g.dart';

/// Request DTO for property feed
@JsonSerializable()
class PropertyFeedRequest {
  final int page;
  final int limit;
  final double? minPrice;
  final double? maxPrice;
  final String? city;
  final String? area;
  final List<String>? propertyTypes;
  final double? latitude;
  final double? longitude;
  final double? radiusKm;
  
  const PropertyFeedRequest({
    this.page = 1,
    this.limit = 20,
    this.minPrice,
    this.maxPrice,
    this.city,
    this.area,
    this.propertyTypes,
    this.latitude,
    this.longitude,
    this.radiusKm,
  });
  
  factory PropertyFeedRequest.fromJson(Map<String, dynamic> json) =>
      _$PropertyFeedRequestFromJson(json);
  
  Map<String, dynamic> toJson() => _$PropertyFeedRequestToJson(this);
}

/// Response DTO for property feed
@JsonSerializable()
class PropertyFeedResponse {
  final List<PropertyListing> properties;
  final int total;
  final bool hasMore;
  final String? nextCursor;
  
  const PropertyFeedResponse({
    required this.properties,
    required this.total,
    required this.hasMore,
    this.nextCursor,
  });
  
  factory PropertyFeedResponse.fromJson(Map<String, dynamic> json) =>
      _$PropertyFeedResponseFromJson(json);
  
  Map<String, dynamic> toJson() => _$PropertyFeedResponseToJson(this);
}

/// Request DTO for recording a swipe
@JsonSerializable()
class SwipeRequest {
  final String propertyId;
  final String action; // 'left', 'right', 'super'
  final DateTime timestamp;
  final Map<String, dynamic>? metadata;
  
  const SwipeRequest({
    required this.propertyId,
    required this.action,
    required this.timestamp,
    this.metadata,
  });
  
  factory SwipeRequest.fromJson(Map<String, dynamic> json) =>
      _$SwipeRequestFromJson(json);
  
  Map<String, dynamic> toJson() => _$SwipeRequestToJson(this);
}

/// Response DTO for swipe action
@JsonSerializable()
class SwipeResponse {
  final bool success;
  final bool isMatch;
  final String? matchId;
  final String message;
  
  const SwipeResponse({
    required this.success,
    required this.isMatch,
    this.matchId,
    required this.message,
  });
  
  factory SwipeResponse.fromJson(Map<String, dynamic> json) =>
      _$SwipeResponseFromJson(json);
  
  Map<String, dynamic> toJson() => _$SwipeResponseToJson(this);
}

/// Request DTO for creating a property
@JsonSerializable()
class CreatePropertyRequest {
  final String title;
  final String description;
  final double price;
  final String propertyType;
  final String listingType;
  final double area;
  final String furnishingStatus;
  final String address;
  final String areaName;
  final String city;
  final String pincode;
  final double latitude;
  final double longitude;
  final List<String> imageUrls;
  final String contactPhone;
  final String contactEmail;
  final DateTime availableFrom;
  
  const CreatePropertyRequest({
    required this.title,
    required this.description,
    required this.price,
    required this.propertyType,
    required this.listingType,
    required this.area,
    required this.furnishingStatus,
    required this.address,
    required this.areaName,
    required this.city,
    required this.pincode,
    required this.latitude,
    required this.longitude,
    required this.imageUrls,
    required this.contactPhone,
    required this.contactEmail,
    required this.availableFrom,
  });
  
  factory CreatePropertyRequest.fromJson(Map<String, dynamic> json) =>
      _$CreatePropertyRequestFromJson(json);
  
  Map<String, dynamic> toJson() => _$CreatePropertyRequestToJson(this);
}

/// Response DTO for property creation
@JsonSerializable()
class CreatePropertyResponse {
  final bool success;
  final String propertyId;
  final String message;
  
  const CreatePropertyResponse({
    required this.success,
    required this.propertyId,
    required this.message,
  });
  
  factory CreatePropertyResponse.fromJson(Map<String, dynamic> json) =>
      _$CreatePropertyResponseFromJson(json);
  
  Map<String, dynamic> toJson() => _$CreatePropertyResponseToJson(this);
}