// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => UserProfile(
      userId: json['userId'] as String,
      personalInfo: PersonalInfo.fromJson(json['personalInfo'] as Map<String, dynamic>),
      preferences: UserPreferences.fromJson(json['preferences'] as Map<String, dynamic>),
      activity: UserActivity.fromJson(json['activity'] as Map<String, dynamic>),
      metadata: UserMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) => <String, dynamic>{
      'userId': instance.userId,
      'personalInfo': instance.personalInfo,
      'preferences': instance.preferences,
      'activity': instance.activity,
      'metadata': instance.metadata,
    };

PersonalInfo _$PersonalInfoFromJson(Map<String, dynamic> json) => PersonalInfo(
      name: json['name'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String?,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      profileImage: json['profileImage'] as String?,
      occupation: json['occupation'] as String?,
      income: (json['income'] as num?)?.toDouble(),
      bio: json['bio'] as String?,
    );

Map<String, dynamic> _$PersonalInfoToJson(PersonalInfo instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'profileImage': instance.profileImage,
      'occupation': instance.occupation,
      'income': instance.income,
      'bio': instance.bio,
    };

UserPreferences _$UserPreferencesFromJson(Map<String, dynamic> json) => UserPreferences(
      propertyTypes: (json['propertyTypes'] as List<dynamic>).map((e) => e as String).toList(),
      budgetRange: BudgetRange.fromJson(json['budgetRange'] as Map<String, dynamic>),
      locationPreferences: LocationPreferences.fromJson(json['locationPreferences'] as Map<String, dynamic>),
      amenityPreferences: (json['amenityPreferences'] as List<dynamic>).map((e) => e as String).toList(),
      maxCommute: json['maxCommute'] as int?,
    );

Map<String, dynamic> _$UserPreferencesToJson(UserPreferences instance) => <String, dynamic>{
      'propertyTypes': instance.propertyTypes,
      'budgetRange': instance.budgetRange,
      'locationPreferences': instance.locationPreferences,
      'amenityPreferences': instance.amenityPreferences,
      'maxCommute': instance.maxCommute,
    };

BudgetRange _$BudgetRangeFromJson(Map<String, dynamic> json) => BudgetRange(
      min: (json['min'] as num).toDouble(),
      max: (json['max'] as num).toDouble(),
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$BudgetRangeToJson(BudgetRange instance) => <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
      'currency': instance.currency,
    };

LocationPreferences _$LocationPreferencesFromJson(Map<String, dynamic> json) => LocationPreferences(
      preferredCities: (json['preferredCities'] as List<dynamic>).map((e) => e as String).toList(),
      preferredNeighborhoods: (json['preferredNeighborhoods'] as List<dynamic>?)?.map((e) => e as String).toList(),
      avoidAreas: (json['avoidAreas'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$LocationPreferencesToJson(LocationPreferences instance) => <String, dynamic>{
      'preferredCities': instance.preferredCities,
      'preferredNeighborhoods': instance.preferredNeighborhoods,
      'avoidAreas': instance.avoidAreas,
    };

UserActivity _$UserActivityFromJson(Map<String, dynamic> json) => UserActivity(
      lastSeen: DateTime.parse(json['lastSeen'] as String),
      totalSwipes: json['totalSwipes'] as int,
      totalMatches: json['totalMatches'] as int,
      totalViews: json['totalViews'] as int,
      averageSessionTime: json['averageSessionTime'] as int,
    );

Map<String, dynamic> _$UserActivityToJson(UserActivity instance) => <String, dynamic>{
      'lastSeen': instance.lastSeen.toIso8601String(),
      'totalSwipes': instance.totalSwipes,
      'totalMatches': instance.totalMatches,
      'totalViews': instance.totalViews,
      'averageSessionTime': instance.averageSessionTime,
    };

UserMetadata _$UserMetadataFromJson(Map<String, dynamic> json) => UserMetadata(
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      isVerified: json['isVerified'] as bool,
      isPremium: json['isPremium'] as bool,
      privacySettings: Map<String, bool>.from(json['privacySettings'] as Map),
    );

Map<String, dynamic> _$UserMetadataToJson(UserMetadata instance) => <String, dynamic>{
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'isVerified': instance.isVerified,
      'isPremium': instance.isPremium,
      'privacySettings': instance.privacySettings,
    };