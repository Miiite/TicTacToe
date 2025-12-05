import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_score.freezed.dart';
part 'game_score.g.dart';

@freezed
sealed class GameScore with _$GameScore {
  factory GameScore({
    required int playerXScore,
    required int playerOScore,
  }) = _GameScore;

  factory GameScore.fromJson(Map<String, dynamic> json) =>
      _$GameScoreFromJson(json);
}
