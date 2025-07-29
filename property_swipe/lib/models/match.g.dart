// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Match _$MatchFromJson(Map<String, dynamic> json) => Match(
      matchId: json['matchId'] as String,
      participants: MatchParticipants.fromJson(json['participants'] as Map<String, dynamic>),
      propertyId: json['propertyId'] as String,
      matchDetails: MatchDetails.fromJson(json['matchDetails'] as Map<String, dynamic>),
      communication: MatchCommunication.fromJson(json['communication'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MatchToJson(Match instance) => <String, dynamic>{
      'matchId': instance.matchId,
      'participants': instance.participants,
      'propertyId': instance.propertyId,
      'matchDetails': instance.matchDetails,
      'communication': instance.communication,
    };

MatchParticipants _$MatchParticipantsFromJson(Map<String, dynamic> json) => MatchParticipants(
      seekerId: json['seekerId'] as String,
      propertyOwnerId: json['propertyOwnerId'] as String,
      seekerProfile: json['seekerProfile'] as Map<String, dynamic>,
      ownerProfile: json['ownerProfile'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$MatchParticipantsToJson(MatchParticipants instance) => <String, dynamic>{
      'seekerId': instance.seekerId,
      'propertyOwnerId': instance.propertyOwnerId,
      'seekerProfile': instance.seekerProfile,
      'ownerProfile': instance.ownerProfile,
    };

MatchDetails _$MatchDetailsFromJson(Map<String, dynamic> json) => MatchDetails(
      seekerSwipeType: $enumDecode(_$SeekerSwipeTypeEnumMap, json['seekerSwipeType']),
      ownerResponse: $enumDecodeNullable(_$OwnerResponseEnumMap, json['ownerResponse']),
      matchedAt: DateTime.parse(json['matchedAt'] as String),
      status: $enumDecode(_$MatchStatusEnumMap, json['status']),
      compatibility: (json['compatibility'] as num).toDouble(),
    );

Map<String, dynamic> _$MatchDetailsToJson(MatchDetails instance) => <String, dynamic>{
      'seekerSwipeType': _$SeekerSwipeTypeEnumMap[instance.seekerSwipeType]!,
      'ownerResponse': _$OwnerResponseEnumMap[instance.ownerResponse],
      'matchedAt': instance.matchedAt.toIso8601String(),
      'status': _$MatchStatusEnumMap[instance.status]!,
      'compatibility': instance.compatibility,
    };

const _$SeekerSwipeTypeEnumMap = {
  SeekerSwipeType.right: 'right',
  SeekerSwipeType.superLike: 'super',
};

const _$OwnerResponseEnumMap = {
  OwnerResponse.interested: 'interested',
  OwnerResponse.notInterested: 'not_interested',
  OwnerResponse.pending: 'pending',
};

const _$MatchStatusEnumMap = {
  MatchStatus.active: 'active',
  MatchStatus.expired: 'expired',
  MatchStatus.blocked: 'blocked',
};

MatchCommunication _$MatchCommunicationFromJson(Map<String, dynamic> json) => MatchCommunication(
      chatEnabled: json['chatEnabled'] as bool,
      lastMessageAt: json['lastMessageAt'] == null
          ? null
          : DateTime.parse(json['lastMessageAt'] as String),
      messageCount: json['messageCount'] as int,
      contactExchanged: json['contactExchanged'] as bool,
    );

Map<String, dynamic> _$MatchCommunicationToJson(MatchCommunication instance) => <String, dynamic>{
      'chatEnabled': instance.chatEnabled,
      'lastMessageAt': instance.lastMessageAt?.toIso8601String(),
      'messageCount': instance.messageCount,
      'contactExchanged': instance.contactExchanged,
    };