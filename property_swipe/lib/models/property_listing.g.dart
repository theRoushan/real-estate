// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_listing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PropertyListing _$PropertyListingFromJson(Map<String, dynamic> json) =>
    PropertyListing(
      propertyId: json['propertyId'] as String,
      basicInfo: BasicInfo.fromJson(json['basicInfo'] as Map<String, dynamic>),
      location:
          PropertyLocation.fromJson(json['location'] as Map<String, dynamic>),
      media: PropertyMedia.fromJson(json['media'] as Map<String, dynamic>),
      ownerInfo: OwnerInfo.fromJson(json['ownerInfo'] as Map<String, dynamic>),
      availability: PropertyAvailability.fromJson(
          json['availability'] as Map<String, dynamic>),
      metadata:
          PropertyMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PropertyListingToJson(PropertyListing instance) =>
    <String, dynamic>{
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
      price: (json['price'] as num).toDouble(),
      propertyType: $enumDecode(_$PropertyTypeEnumMap, json['propertyType']),
      listingType: $enumDecode(_$ListingTypeEnumMap, json['listingType']),
      area: (json['area'] as num).toDouble(),
      furnishingStatus:
          $enumDecode(_$FurnishingStatusEnumMap, json['furnishingStatus']),
    );

Map<String, dynamic> _$BasicInfoToJson(BasicInfo instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'propertyType': _$PropertyTypeEnumMap[instance.propertyType]!,
      'listingType': _$ListingTypeEnumMap[instance.listingType]!,
      'area': instance.area,
      'furnishingStatus': _$FurnishingStatusEnumMap[instance.furnishingStatus]!,
    };

const _$PropertyTypeEnumMap = {
  PropertyType.oneBhk: '1BHK',
  PropertyType.twoBhk: '2BHK',
  PropertyType.threeBhk: '3BHK',
  PropertyType.fourBhk: '4BHK',
  PropertyType.house: 'house',
  PropertyType.commercial: 'commercial',
};

const _$ListingTypeEnumMap = {
  ListingType.rent: 'rent',
  ListingType.sale: 'sale',
};

const _$FurnishingStatusEnumMap = {
  FurnishingStatus.unfurnished: 'unfurnished',
  FurnishingStatus.semiFurnished: 'semi-furnished',
  FurnishingStatus.fullyFurnished: 'fully-furnished',
};

PropertyLocation _$PropertyLocationFromJson(Map<String, dynamic> json) =>
    PropertyLocation(
      address: json['address'] as String,
      area: json['area'] as String,
      city: json['city'] as String,
      pincode: json['pincode'] as String,
      coordinates:
          Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PropertyLocationToJson(PropertyLocation instance) =>
    <String, dynamic>{
      'address': instance.address,
      'area': instance.area,
      'city': instance.city,
      'pincode': instance.pincode,
      'coordinates': instance.coordinates,
    };

Coordinates _$CoordinatesFromJson(Map<String, dynamic> json) => Coordinates(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$CoordinatesToJson(Coordinates instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

PropertyMedia _$PropertyMediaFromJson(Map<String, dynamic> json) =>
    PropertyMedia(
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      primaryImage: json['primaryImage'] as String,
    );

Map<String, dynamic> _$PropertyMediaToJson(PropertyMedia instance) =>
    <String, dynamic>{
      'images': instance.images,
      'primaryImage': instance.primaryImage,
    };

OwnerInfo _$OwnerInfoFromJson(Map<String, dynamic> json) => OwnerInfo(
      ownerId: json['ownerId'] as String,
      contactPhone: json['contactPhone'] as String,
      contactEmail: json['contactEmail'] as String,
      responseTime: json['responseTime'] as String,
    );

Map<String, dynamic> _$OwnerInfoToJson(OwnerInfo instance) => <String, dynamic>{
      'ownerId': instance.ownerId,
      'contactPhone': instance.contactPhone,
      'contactEmail': instance.contactEmail,
      'responseTime': instance.responseTime,
    };

PropertyAvailability _$PropertyAvailabilityFromJson(
        Map<String, dynamic> json) =>
    PropertyAvailability(
      availableFrom: DateTime.parse(json['availableFrom'] as String),
      status: $enumDecode(_$PropertyStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$PropertyAvailabilityToJson(
        PropertyAvailability instance) =>
    <String, dynamic>{
      'availableFrom': instance.availableFrom.toIso8601String(),
      'status': _$PropertyStatusEnumMap[instance.status]!,
    };

const _$PropertyStatusEnumMap = {
  PropertyStatus.active: 'active',
  PropertyStatus.inactive: 'inactive',
  PropertyStatus.rented: 'rented',
  PropertyStatus.sold: 'sold',
};

PropertyMetadata _$PropertyMetadataFromJson(Map<String, dynamic> json) =>
    PropertyMetadata(
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      views: (json['views'] as num).toInt(),
      rightSwipes: (json['rightSwipes'] as num).toInt(),
      leftSwipes: (json['leftSwipes'] as num).toInt(),
    );

Map<String, dynamic> _$PropertyMetadataToJson(PropertyMetadata instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'views': instance.views,
      'rightSwipes': instance.rightSwipes,
      'leftSwipes': instance.leftSwipes,
    };
