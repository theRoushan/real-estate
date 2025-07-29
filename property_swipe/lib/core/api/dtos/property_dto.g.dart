// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PropertyFeedRequest _$PropertyFeedRequestFromJson(Map<String, dynamic> json) =>
    PropertyFeedRequest(
      page: json['page'] as int? ?? 1,
      limit: json['limit'] as int? ?? 20,
      minPrice: (json['minPrice'] as num?)?.toDouble(),
      maxPrice: (json['maxPrice'] as num?)?.toDouble(),
      city: json['city'] as String?,
      area: json['area'] as String?,
      propertyTypes: (json['propertyTypes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      radiusKm: (json['radiusKm'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PropertyFeedRequestToJson(PropertyFeedRequest instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'minPrice': instance.minPrice,
      'maxPrice': instance.maxPrice,
      'city': instance.city,
      'area': instance.area,
      'propertyTypes': instance.propertyTypes,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'radiusKm': instance.radiusKm,
    };

PropertyFeedResponse _$PropertyFeedResponseFromJson(Map<String, dynamic> json) =>
    PropertyFeedResponse(
      properties: (json['properties'] as List<dynamic>)
          .map((e) => PropertyListing.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int,
      hasMore: json['hasMore'] as bool,
      nextCursor: json['nextCursor'] as String?,
    );

Map<String, dynamic> _$PropertyFeedResponseToJson(PropertyFeedResponse instance) =>
    <String, dynamic>{
      'properties': instance.properties,
      'total': instance.total,
      'hasMore': instance.hasMore,
      'nextCursor': instance.nextCursor,
    };

SwipeRequest _$SwipeRequestFromJson(Map<String, dynamic> json) => SwipeRequest(
      propertyId: json['propertyId'] as String,
      action: json['action'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$SwipeRequestToJson(SwipeRequest instance) =>
    <String, dynamic>{
      'propertyId': instance.propertyId,
      'action': instance.action,
      'timestamp': instance.timestamp.toIso8601String(),
      'metadata': instance.metadata,
    };

SwipeResponse _$SwipeResponseFromJson(Map<String, dynamic> json) =>
    SwipeResponse(
      success: json['success'] as bool,
      isMatch: json['isMatch'] as bool,
      matchId: json['matchId'] as String?,
      message: json['message'] as String,
    );

Map<String, dynamic> _$SwipeResponseToJson(SwipeResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'isMatch': instance.isMatch,
      'matchId': instance.matchId,
      'message': instance.message,
    };

CreatePropertyRequest _$CreatePropertyRequestFromJson(Map<String, dynamic> json) =>
    CreatePropertyRequest(
      title: json['title'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      propertyType: json['propertyType'] as String,
      listingType: json['listingType'] as String,
      area: (json['area'] as num).toDouble(),
      furnishingStatus: json['furnishingStatus'] as String,
      address: json['address'] as String,
      areaName: json['areaName'] as String,
      city: json['city'] as String,
      pincode: json['pincode'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      imageUrls: (json['imageUrls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      contactPhone: json['contactPhone'] as String,
      contactEmail: json['contactEmail'] as String,
      availableFrom: DateTime.parse(json['availableFrom'] as String),
    );

Map<String, dynamic> _$CreatePropertyRequestToJson(CreatePropertyRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'propertyType': instance.propertyType,
      'listingType': instance.listingType,
      'area': instance.area,
      'furnishingStatus': instance.furnishingStatus,
      'address': instance.address,
      'areaName': instance.areaName,
      'city': instance.city,
      'pincode': instance.pincode,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'imageUrls': instance.imageUrls,
      'contactPhone': instance.contactPhone,
      'contactEmail': instance.contactEmail,
      'availableFrom': instance.availableFrom.toIso8601String(),
    };

CreatePropertyResponse _$CreatePropertyResponseFromJson(Map<String, dynamic> json) =>
    CreatePropertyResponse(
      success: json['success'] as bool,
      propertyId: json['propertyId'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$CreatePropertyResponseToJson(CreatePropertyResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'propertyId': instance.propertyId,
      'message': instance.message,
    };