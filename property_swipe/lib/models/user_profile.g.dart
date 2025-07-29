// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => UserProfile(
      userId: json['userId'] as String,
      personalInfo:
          PersonalInfo.fromJson(json['personalInfo'] as Map<String, dynamic>),
      preferences:
          UserPreferences.fromJson(json['preferences'] as Map<String, dynamic>),
      activity: UserActivity.fromJson(json['activity'] as Map<String, dynamic>),
      metadata: UserMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'personalInfo': instance.personalInfo,
      'preferences': instance.preferences,
      'activity': instance.activity,
      'metadata': instance.metadata,
    };

PersonalInfo _$PersonalInfoFromJson(Map<String, dynamic> json) => PersonalInfo(
      name: json['name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      profileImage: json['profileImage'] as String?,
      userType: $enumDecode(_$UserTypeEnumMap, json['userType']),
    );

Map<String, dynamic> _$PersonalInfoToJson(PersonalInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'profileImage': instance.profileImage,
      'userType': _$UserTypeEnumMap[instance.userType]!,
    };

const _$UserTypeEnumMap = {
  UserType.seeker: 'seeker',
  UserType.owner: 'owner',
  UserType.both: 'both',
};

UserPreferences _$UserPreferencesFromJson(Map<String, dynamic> json) =>
    UserPreferences(
      budget: BudgetRange.fromJson(json['budget'] as Map<String, dynamic>),
      location: LocationPreferences.fromJson(
          json['location'] as Map<String, dynamic>),
      propertyTypes: (json['propertyTypes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      amenities:
          (json['amenities'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$UserPreferencesToJson(UserPreferences instance) =>
    <String, dynamic>{
      'budget': instance.budget,
      'location': instance.location,
      'propertyTypes': instance.propertyTypes,
      'amenities': instance.amenities,
    };

BudgetRange _$BudgetRangeFromJson(Map<String, dynamic> json) => BudgetRange(
      min: (json['min'] as num).toDouble(),
      max: (json['max'] as num).toDouble(),
    );

Map<String, dynamic> _$BudgetRangeToJson(BudgetRange instance) =>
    <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
    };

LocationPreferences _$LocationPreferencesFromJson(Map<String, dynamic> json) =>
    LocationPreferences(
      preferredCities: (json['preferredCities'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      preferredAreas: (json['preferredAreas'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$LocationPreferencesToJson(
        LocationPreferences instance) =>
    <String, dynamic>{
      'preferredCities': instance.preferredCities,
      'preferredAreas': instance.preferredAreas,
    };

UserActivity _$UserActivityFromJson(Map<String, dynamic> json) => UserActivity(
      swipeHistory: (json['swipeHistory'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, $enumDecode(_$SwipeActionEnumMap, e)),
      ),
      favorites:
          (json['favorites'] as List<dynamic>).map((e) => e as String).toList(),
      matches:
          (json['matches'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$UserActivityToJson(UserActivity instance) =>
    <String, dynamic>{
      'swipeHistory': instance.swipeHistory
          .map((k, e) => MapEntry(k, _$SwipeActionEnumMap[e]!)),
      'favorites': instance.favorites,
      'matches': instance.matches,
    };

const _$SwipeActionEnumMap = {
  SwipeAction.left: 'left',
  SwipeAction.right: 'right',
  SwipeAction.superLike: 'super',
};

UserMetadata _$UserMetadataFromJson(Map<String, dynamic> json) => UserMetadata(
      createdAt: DateTime.parse(json['createdAt'] as String),
      lastActive: DateTime.parse(json['lastActive'] as String),
      verified: json['verified'] as bool,
    );

Map<String, dynamic> _$UserMetadataToJson(UserMetadata instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt.toIso8601String(),
      'lastActive': instance.lastActive.toIso8601String(),
      'verified': instance.verified,
    };
