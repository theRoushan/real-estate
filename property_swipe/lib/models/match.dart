import 'package:json_annotation/json_annotation.dart';

part 'match.g.dart';

@JsonSerializable()
class Match {
  final String matchId;
  final MatchParticipants participants;
  final String propertyId;
  final MatchDetails matchDetails;
  final MatchCommunication communication;
  final MatchStatus status;

  const Match({
    required this.matchId,
    required this.participants,
    required this.propertyId,
    required this.matchDetails,
    required this.communication,
    required this.status,
  });

  factory Match.fromJson(Map<String, dynamic> json) => _$MatchFromJson(json);
  
  Map<String, dynamic> toJson() => _$MatchToJson(this);

  Match copyWith({
    String? matchId,
    MatchParticipants? participants,
    String? propertyId,
    MatchDetails? matchDetails,
    MatchCommunication? communication,
    MatchStatus? status,
  }) {
    return Match(
      matchId: matchId ?? this.matchId,
      participants: participants ?? this.participants,
      propertyId: propertyId ?? this.propertyId,
      matchDetails: matchDetails ?? this.matchDetails,
      communication: communication ?? this.communication,
      status: status ?? this.status,
    );
  }
}

@JsonSerializable()
class MatchParticipants {
  final String seekerId;
  final String ownerId;

  const MatchParticipants({
    required this.seekerId,
    required this.ownerId,
  });

  factory MatchParticipants.fromJson(Map<String, dynamic> json) =>
      _$MatchParticipantsFromJson(json);
  
  Map<String, dynamic> toJson() => _$MatchParticipantsToJson(this);

  MatchParticipants copyWith({
    String? seekerId,
    String? ownerId,
  }) {
    return MatchParticipants(
      seekerId: seekerId ?? this.seekerId,
      ownerId: ownerId ?? this.ownerId,
    );
  }
}

@JsonSerializable()
class MatchDetails {
  final DateTime matchedAt;
  final SeekerSwipeType seekerSwipe;
  final bool ownerInterest;

  const MatchDetails({
    required this.matchedAt,
    required this.seekerSwipe,
    required this.ownerInterest,
  });

  factory MatchDetails.fromJson(Map<String, dynamic> json) =>
      _$MatchDetailsFromJson(json);
  
  Map<String, dynamic> toJson() => _$MatchDetailsToJson(this);

  MatchDetails copyWith({
    DateTime? matchedAt,
    SeekerSwipeType? seekerSwipe,
    bool? ownerInterest,
  }) {
    return MatchDetails(
      matchedAt: matchedAt ?? this.matchedAt,
      seekerSwipe: seekerSwipe ?? this.seekerSwipe,
      ownerInterest: ownerInterest ?? this.ownerInterest,
    );
  }
}

@JsonSerializable()
class MatchCommunication {
  final String chatRoomId;
  final DateTime? lastMessageAt;
  final int messageCount;

  const MatchCommunication({
    required this.chatRoomId,
    this.lastMessageAt,
    required this.messageCount,
  });

  factory MatchCommunication.fromJson(Map<String, dynamic> json) =>
      _$MatchCommunicationFromJson(json);
  
  Map<String, dynamic> toJson() => _$MatchCommunicationToJson(this);

  MatchCommunication copyWith({
    String? chatRoomId,
    DateTime? lastMessageAt,
    int? messageCount,
  }) {
    return MatchCommunication(
      chatRoomId: chatRoomId ?? this.chatRoomId,
      lastMessageAt: lastMessageAt ?? this.lastMessageAt,
      messageCount: messageCount ?? this.messageCount,
    );
  }
}

enum SeekerSwipeType {
  @JsonValue('right')
  right,
  @JsonValue('super')
  superLike,
}

enum MatchStatus {
  @JsonValue('active')
  active,
  @JsonValue('archived')
  archived,
  @JsonValue('blocked')
  blocked,
}