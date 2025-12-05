import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoe/features/game/models/player.dart';

part 'game_result.freezed.dart';

@freezed
sealed class GameResult with _$GameResult {
  factory GameResult.draw() = _Draw;
  factory GameResult.winner({
    required Player winner,
  }) = _Winner;
}
