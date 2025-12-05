// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_score.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GameScore _$GameScoreFromJson(Map<String, dynamic> json) => _GameScore(
  playerXScore: (json['playerXScore'] as num).toInt(),
  playerOScore: (json['playerOScore'] as num).toInt(),
);

Map<String, dynamic> _$GameScoreToJson(_GameScore instance) =>
    <String, dynamic>{
      'playerXScore': instance.playerXScore,
      'playerOScore': instance.playerOScore,
    };
