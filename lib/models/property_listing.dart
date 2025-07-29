import 'package:json_annotation/json_annotation.dart';

part 'property_listing.g.dart';

@JsonSerializable()
class PropertyListing {
  final String propertyId;
  final BasicInfo basicInfo;
  final PropertyLocation location;
  final PropertyMedia media;
  final OwnerInfo ownerInfo;
  final PropertyAvailability availability;
  final PropertyMetadata metadata;

  const PropertyListing({
    required this.propertyId,
    required this.basicInfo,
    required this.location,
    required this.media,
    required this.ownerInfo,
    required this.availability,
    required this.metadata,
  });

  factory PropertyListing.fromJson(Map<String, dynamic> json) =>
      _$PropertyListingFromJson(json);
  
  Map<String, dynamic> toJson() => _$PropertyListingToJson(this);

  PropertyListing copyWith({
    String? propertyId,
    BasicInfo? basicInfo,
    PropertyLocation? location,
    PropertyMedia? media,
    OwnerInfo? ownerInfo,
    PropertyAvailability? availability,
    PropertyMetadata? metadata,
  }) {
    return PropertyListing(
      propertyId: propertyId ?? this.propertyId,
      basicInfo: basicInfo ?? this.basicInfo,
      location: location ?? this.location,
      media: media ?? this.media,
      ownerInfo: ownerInfo ?? this.ownerInfo,
      availability: availability ?? this.availability,
      metadata: metadata ?? this.metadata,
    );
  }
}

@JsonSerializable()
class BasicInfo {
  final String title;
  final String description;
  final double price;
  final PropertyType propertyType;
  final ListingType listingType;
  final double area;
  final FurnishingStatus furnishingStatus;

  const BasicInfo({
    required this.title,
    required this.description,
    required this.price,
    required this.propertyType,
    required this.listingType,
    required this.area,
    required this.furnishingStatus,
  });

  factory BasicInfo.fromJson(Map<String, dynamic> json) =>
      _$BasicInfoFromJson(json);
  
  Map<String, dynamic> toJson() => _$BasicInfoToJson(this);

  BasicInfo copyWith({
    String? title,
    String? description,
    double? price,
    PropertyType? propertyType,
    ListingType? listingType,
    double? area,
    FurnishingStatus? furnishingStatus,
  }) {
    return BasicInfo(
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      propertyType: propertyType ?? this.propertyType,
      listingType: listingType ?? this.listingType,
      area: area ?? this.area,
      furnishingStatus: furnishingStatus ?? this.furnishingStatus,
    );
  }
}

@JsonSerializable()
class PropertyLocation {
  final String address;
  final String area;
  final String city;
  final String pincode;
  final Coordinates coordinates;

  const PropertyLocation({
    required this.address,
    required this.area,
    required this.city,
    required this.pincode,
    required this.coordinates,
  });

  factory PropertyLocation.fromJson(Map<String, dynamic> json) =>
      _$PropertyLocationFromJson(json);
  
  Map<String, dynamic> toJson() => _$PropertyLocationToJson(this);

  PropertyLocation copyWith({
    String? address,
    String? area,
    String? city,
    String? pincode,
    Coordinates? coordinates,
  }) {
    return PropertyLocation(
      address: address ?? this.address,
      area: area ?? this.area,
      city: city ?? this.city,
      pincode: pincode ?? this.pincode,
      coordinates: coordinates ?? this.coordinates,
    );
  }
}

@JsonSerializable()
class Coordinates {
  final double latitude;
  final double longitude;

  const Coordinates({
    required this.latitude,
    required this.longitude,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesFromJson(json);
  
  Map<String, dynamic> toJson() => _$CoordinatesToJson(this);

  Coordinates copyWith({
    double? latitude,
    double? longitude,
  }) {
    return Coordinates(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }
}

@JsonSerializable()
class PropertyMedia {
  final List<String> images;
  final String primaryImage;

  const PropertyMedia({
    required this.images,
    required this.primaryImage,
  });

  factory PropertyMedia.fromJson(Map<String, dynamic> json) =>
      _$PropertyMediaFromJson(json);
  
  Map<String, dynamic> toJson() => _$PropertyMediaToJson(this);

  PropertyMedia copyWith({
    List<String>? images,
    String? primaryImage,
  }) {
    return PropertyMedia(
      images: images ?? this.images,
      primaryImage: primaryImage ?? this.primaryImage,
    );
  }
}

@JsonSerializable()
class OwnerInfo {
  final String ownerId;
  final String contactPhone;
  final String contactEmail;
  final String responseTime;

  const OwnerInfo({
    required this.ownerId,
    required this.contactPhone,
    required this.contactEmail,
    required this.responseTime,
  });

  factory OwnerInfo.fromJson(Map<String, dynamic> json) =>
      _$OwnerInfoFromJson(json);
  
  Map<String, dynamic> toJson() => _$OwnerInfoToJson(this);

  OwnerInfo copyWith({
    String? ownerId,
    String? contactPhone,
    String? contactEmail,
    String? responseTime,
  }) {
    return OwnerInfo(
      ownerId: ownerId ?? this.ownerId,
      contactPhone: contactPhone ?? this.contactPhone,
      contactEmail: contactEmail ?? this.contactEmail,
      responseTime: responseTime ?? this.responseTime,
    );
  }
}

@JsonSerializable()
class PropertyAvailability {
  final DateTime availableFrom;
  final PropertyStatus status;

  const PropertyAvailability({
    required this.availableFrom,
    required this.status,
  });

  factory PropertyAvailability.fromJson(Map<String, dynamic> json) =>
      _$PropertyAvailabilityFromJson(json);
  
  Map<String, dynamic> toJson() => _$PropertyAvailabilityToJson(this);

  PropertyAvailability copyWith({
    DateTime? availableFrom,
    PropertyStatus? status,
  }) {
    return PropertyAvailability(
      availableFrom: availableFrom ?? this.availableFrom,
      status: status ?? this.status,
    );
  }
}

@JsonSerializable()
class PropertyMetadata {
  final DateTime createdAt;
  final DateTime updatedAt;
  final int views;
  final int rightSwipes;
  final int leftSwipes;

  const PropertyMetadata({
    required this.createdAt,
    required this.updatedAt,
    required this.views,
    required this.rightSwipes,
    required this.leftSwipes,
  });

  factory PropertyMetadata.fromJson(Map<String, dynamic> json) =>
      _$PropertyMetadataFromJson(json);
  
  Map<String, dynamic> toJson() => _$PropertyMetadataToJson(this);

  PropertyMetadata copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    int? views,
    int? rightSwipes,
    int? leftSwipes,
  }) {
    return PropertyMetadata(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      views: views ?? this.views,
      rightSwipes: rightSwipes ?? this.rightSwipes,
      leftSwipes: leftSwipes ?? this.leftSwipes,
    );
  }
}

enum PropertyType {
  @JsonValue('1BHK')
  oneBhk,
  @JsonValue('2BHK')
  twoBhk,
  @JsonValue('3BHK')
  threeBhk,
  @JsonValue('4BHK')
  fourBhk,
  @JsonValue('house')
  house,
  @JsonValue('commercial')
  commercial,
}

enum ListingType {
  @JsonValue('rent')
  rent,
  @JsonValue('sale')
  sale,
}

enum FurnishingStatus {
  @JsonValue('unfurnished')
  unfurnished,
  @JsonValue('semi-furnished')
  semiFurnished,
  @JsonValue('fully-furnished')
  fullyFurnished,
}

enum PropertyStatus {
  @JsonValue('active')
  active,
  @JsonValue('inactive')
  inactive,
  @JsonValue('rented')
  rented,
  @JsonValue('sold')
  sold,
}