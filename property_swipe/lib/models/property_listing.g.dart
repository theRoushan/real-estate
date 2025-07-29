// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_listing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PropertyListing _$PropertyListingFromJson(Map<String, dynamic> json) => PropertyListing(
      propertyId: json['propertyId'] as String,
      basicInfo: BasicInfo.fromJson(json['basicInfo'] as Map<String, dynamic>),
      location: PropertyLocation.fromJson(json['location'] as Map<String, dynamic>),
      media: PropertyMedia.fromJson(json['media'] as Map<String, dynamic>),
      ownerInfo: OwnerInfo.fromJson(json['ownerInfo'] as Map<String, dynamic>),
      availability: PropertyAvailability.fromJson(json['availability'] as Map<String, dynamic>),
      metadata: PropertyMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PropertyListingToJson(PropertyListing instance) => <String, dynamic>{
      'propertyId': instance.propertyId,
      'basicInfo': instance.basicInfo,
      'location': instance.location,
      'media': instance.media,
      'ownerInfo': instance.ownerInfo,
      'availability': instance.availability,
      'metadata': instance.metadata,
    };

BasicInfo _$BasicInfoFromJson(Map<String, dynamic> json) => BasicInfo(
      title: json['title'] as String,
      description: json['description'] as String,
      propertyType: json['propertyType'] as String,
      price: (json['price'] as num).toDouble(),
      currency: json['currency'] as String,
      area: (json['area'] as num).toDouble(),
      areaUnit: json['areaUnit'] as String,
      bedrooms: json['bedrooms'] as int?,
      bathrooms: json['bathrooms'] as int?,
      amenities: (json['amenities'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$BasicInfoToJson(BasicInfo instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'propertyType': instance.propertyType,
      'price': instance.price,
      'currency': instance.currency,
      'area': instance.area,
      'areaUnit': instance.areaUnit,
      'bedrooms': instance.bedrooms,
      'bathrooms': instance.bathrooms,
      'amenities': instance.amenities,
    };

PropertyLocation _$PropertyLocationFromJson(Map<String, dynamic> json) => PropertyLocation(
      address: json['address'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      country: json['country'] as String,
      pincode: json['pincode'] as String,
      coordinates: Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>),
      neighborhood: json['neighborhood'] as String?,
      landmarks: (json['landmarks'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PropertyLocationToJson(PropertyLocation instance) => <String, dynamic>{
      'address': instance.address,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'pincode': instance.pincode,
      'coordinates': instance.coordinates,
      'neighborhood': instance.neighborhood,
      'landmarks': instance.landmarks,
    };

Coordinates _$CoordinatesFromJson(Map<String, dynamic> json) => Coordinates(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$CoordinatesToJson(Coordinates instance) => <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

PropertyMedia _$PropertyMediaFromJson(Map<String, dynamic> json) => PropertyMedia(
      images: (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      videos: (json['videos'] as List<dynamic>?)?.map((e) => e as String).toList(),
      virtualTourUrl: json['virtualTourUrl'] as String?,
      floorPlan: json['floorPlan'] as String?,
    );

Map<String, dynamic> _$PropertyMediaToJson(PropertyMedia instance) => <String, dynamic>{
      'images': instance.images,
      'videos': instance.videos,
      'virtualTourUrl': instance.virtualTourUrl,
      'floorPlan': instance.floorPlan,
    };

OwnerInfo _$OwnerInfoFromJson(Map<String, dynamic> json) => OwnerInfo(
      ownerId: json['ownerId'] as String,
      name: json['name'] as String,
      contactNumber: json['contactNumber'] as String?,
      email: json['email'] as String?,
      isVerified: json['isVerified'] as bool,
      responseTime: json['responseTime'] as String?,
    );

Map<String, dynamic> _$OwnerInfoToJson(OwnerInfo instance) => <String, dynamic>{
      'ownerId': instance.ownerId,
      'name': instance.name,
      'contactNumber': instance.contactNumber,
      'email': instance.email,
      'isVerified': instance.isVerified,
      'responseTime': instance.responseTime,
    };

PropertyAvailability _$PropertyAvailabilityFromJson(Map<String, dynamic> json) => PropertyAvailability(
      isAvailable: json['isAvailable'] as bool,
      availableFrom: json['availableFrom'] == null
          ? null
          : DateTime.parse(json['availableFrom'] as String),
      leaseDuration: json['leaseDuration'] as String?,
      preferredTenantType: json['preferredTenantType'] as String?,
    );

Map<String, dynamic> _$PropertyAvailabilityToJson(PropertyAvailability instance) => <String, dynamic>{
      'isAvailable': instance.isAvailable,
      'availableFrom': instance.availableFrom?.toIso8601String(),
      'leaseDuration': instance.leaseDuration,
      'preferredTenantType': instance.preferredTenantType,
    };

PropertyMetadata _$PropertyMetadataFromJson(Map<String, dynamic> json) => PropertyMetadata(
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      views: json['views'] as int,
      likes: json['likes'] as int,
      featured: json['featured'] as bool,
      verified: json['verified'] as bool,
    );

Map<String, dynamic> _$PropertyMetadataToJson(PropertyMetadata instance) => <String, dynamic>{
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'views': instance.views,
      'likes': instance.likes,
      'featured': instance.featured,
      'verified': instance.verified,
    };