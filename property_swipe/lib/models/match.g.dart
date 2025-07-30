// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Match _$MatchFromJson(Map<String, dynamic> json) => Match(
      matchId: json['matchId'] as String,
      participants: MatchParticipants.fromJson(
          json['participants'] as Map<String, dynamic>),
      propertyId: json['propertyId'] as String,
      matchDetails:
          MatchDetails.fromJson(json['matchDetails'] as Map<String, dynamic>),
      communication: MatchCommunication.fromJson(
          json['communication'] as Map<String, dynamic>),
      status: $enumDecode(_$MatchStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$MatchToJson(Match instance) => <String, dynamic>{
      'matchId': instance.matchId,
      'participants': instance.participants,
      'propertyId': instance.propertyId,
      'matchDetails': instance.matchDetails,
      'communication': instance.communication,
      'status': _$MatchStatusEnumMap[instance.status]!,
    };

const _$MatchStatusEnumMap = {
  MatchStatus.active: 'active',
  MatchStatus.archived: 'archived',
  MatchStatus.blocked: 'blocked',
};

MatchParticipants _$MatchParticipantsFromJson(Map<String, dynamic> json) =>
    MatchParticipants(
      seekerId: json['seekerId'] as String,
      ownerId: json['ownerId'] as String,
    );

Map<String, dynamic> _$MatchParticipantsToJson(MatchParticipants instance) =>
    <String, dynamic>{
      'seekerId': instance.seekerId,
      'ownerId': instance.ownerId,
    };

MatchDetails _$MatchDetailsFromJson(Map<String, dynamic> json) => MatchDetails(
      matchedAt: DateTime.parse(json['matchedAt'] as String),
      seekerSwipe: $enumDecode(_$SeekerSwipeTypeEnumMap, json['seekerSwipe']),
      ownerInterest: json['ownerInterest'] as bool,
    );

Map<String, dynamic> _$MatchDetailsToJson(MatchDetails instance) =>
    <String, dynamic>{
      'matchedAt': instance.matchedAt.toIso8601String(),
      'seekerSwipe': _$SeekerSwipeTypeEnumMap[instance.seekerSwipe]!,
      'ownerInterest': instance.ownerInterest,
    };

const _$SeekerSwipeTypeEnumMap = {
  SeekerSwipeType.right: 'right',
  SeekerSwipeType.superLike: 'super',
};

MatchCommunication _$MatchCommunicationFromJson(Map<String, dynamic> json) =>
    MatchCommunication(
      chatRoomId: json['chatRoomId'] as String,
      lastMessageAt: json['lastMessageAt'] == null
          ? null
          : DateTime.parse(json['lastMessageAt'] as String),
      messageCount: (json['messageCount'] as num).toInt(),
    );

Map<String, dynamic> _$MatchCommunicationToJson(MatchCommunication instance) =>
    <String, dynamic>{
      'chatRoomId': instance.chatRoomId,
      'lastMessageAt': instance.lastMessageAt?.toIso8601String(),
      'messageCount': instance.messageCount,
    };
