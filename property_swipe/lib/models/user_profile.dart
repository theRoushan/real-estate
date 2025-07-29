import 'package:json_annotation/json_annotation.dart';

part 'user_profile.g.dart';

@JsonSerializable()
class UserProfile {
  final String userId;
  final PersonalInfo personalInfo;
  final UserPreferences preferences;
  final UserActivity activity;
  final UserMetadata metadata;

  const UserProfile({
    required this.userId,
    required this.personalInfo,
    required this.preferences,
    required this.activity,
    required this.metadata,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
  
  Map<String, dynamic> toJson() => _$UserProfileToJson(this);

  UserProfile copyWith({
    String? userId,
    PersonalInfo? personalInfo,
    UserPreferences? preferences,
    UserActivity? activity,
    UserMetadata? metadata,
  }) {
    return UserProfile(
      userId: userId ?? this.userId,
      personalInfo: personalInfo ?? this.personalInfo,
      preferences: preferences ?? this.preferences,
      activity: activity ?? this.activity,
      metadata: metadata ?? this.metadata,
    );
  }
}

@JsonSerializable()
class PersonalInfo {
  final String name;
  final String phone;
  final String email;
  final String? profileImage;
  final UserType userType;

  const PersonalInfo({
    required this.name,
    required this.phone,
    required this.email,
    this.profileImage,
    required this.userType,
  });

  factory PersonalInfo.fromJson(Map<String, dynamic> json) =>
      _$PersonalInfoFromJson(json);
  
  Map<String, dynamic> toJson() => _$PersonalInfoToJson(this);

  PersonalInfo copyWith({
    String? name,
    String? phone,
    String? email,
    String? profileImage,
    UserType? userType,
  }) {
    return PersonalInfo(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      profileImage: profileImage ?? this.profileImage,
      userType: userType ?? this.userType,
    );
  }
}

@JsonSerializable()
class UserPreferences {
  final BudgetRange budget;
  final LocationPreferences location;
  final List<String> propertyTypes;
  final List<String> amenities;

  const UserPreferences({
    required this.budget,
    required this.location,
    required this.propertyTypes,
    required this.amenities,
  });

  factory UserPreferences.fromJson(Map<String, dynamic> json) =>
      _$UserPreferencesFromJson(json);
  
  Map<String, dynamic> toJson() => _$UserPreferencesToJson(this);

  UserPreferences copyWith({
    BudgetRange? budget,
    LocationPreferences? location,
    List<String>? propertyTypes,
    List<String>? amenities,
  }) {
    return UserPreferences(
      budget: budget ?? this.budget,
      location: location ?? this.location,
      propertyTypes: propertyTypes ?? this.propertyTypes,
      amenities: amenities ?? this.amenities,
    );
  }
}

@JsonSerializable()
class BudgetRange {
  final double min;
  final double max;

  const BudgetRange({
    required this.min,
    required this.max,
  });

  factory BudgetRange.fromJson(Map<String, dynamic> json) =>
      _$BudgetRangeFromJson(json);
  
  Map<String, dynamic> toJson() => _$BudgetRangeToJson(this);

  BudgetRange copyWith({
    double? min,
    double? max,
  }) {
    return BudgetRange(
      min: min ?? this.min,
      max: max ?? this.max,
    );
  }
}

@JsonSerializable()
class LocationPreferences {
  final List<String> preferredCities;
  final List<String> preferredAreas;

  const LocationPreferences({
    required this.preferredCities,
    required this.preferredAreas,
  });

  factory LocationPreferences.fromJson(Map<String, dynamic> json) =>
      _$LocationPreferencesFromJson(json);
  
  Map<String, dynamic> toJson() => _$LocationPreferencesToJson(this);

  LocationPreferences copyWith({
    List<String>? preferredCities,
    List<String>? preferredAreas,
  }) {
    return LocationPreferences(
      preferredCities: preferredCities ?? this.preferredCities,
      preferredAreas: preferredAreas ?? this.preferredAreas,
    );
  }
}

@JsonSerializable()
class UserActivity {
  final Map<String, SwipeAction> swipeHistory;
  final List<String> favorites;
  final List<String> matches;

  const UserActivity({
    required this.swipeHistory,
    required this.favorites,
    required this.matches,
  });

  factory UserActivity.fromJson(Map<String, dynamic> json) =>
      _$UserActivityFromJson(json);
  
  Map<String, dynamic> toJson() => _$UserActivityToJson(this);

  UserActivity copyWith({
    Map<String, SwipeAction>? swipeHistory,
    List<String>? favorites,
    List<String>? matches,
  }) {
    return UserActivity(
      swipeHistory: swipeHistory ?? this.swipeHistory,
      favorites: favorites ?? this.favorites,
      matches: matches ?? this.matches,
    );
  }
}

@JsonSerializable()
class UserMetadata {
  final DateTime createdAt;
  final DateTime lastActive;
  final bool verified;

  const UserMetadata({
    required this.createdAt,
    required this.lastActive,
    required this.verified,
  });

  factory UserMetadata.fromJson(Map<String, dynamic> json) =>
      _$UserMetadataFromJson(json);
  
  Map<String, dynamic> toJson() => _$UserMetadataToJson(this);

  UserMetadata copyWith({
    DateTime? createdAt,
    DateTime? lastActive,
    bool? verified,
  }) {
    return UserMetadata(
      createdAt: createdAt ?? this.createdAt,
      lastActive: lastActive ?? this.lastActive,
      verified: verified ?? this.verified,
    );
  }
}

enum UserType {
  @JsonValue('seeker')
  seeker,
  @JsonValue('owner')
  owner,
  @JsonValue('both')
  both,
}

enum SwipeAction {
  @JsonValue('left')
  left,
  @JsonValue('right')
  right,
  @JsonValue('super')
  superLike,
}