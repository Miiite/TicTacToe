import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoe/utils/game_colors.dart';

part 'player.freezed.dart';

enum PlayerType { x, o }

@freezed
class Player with _$Player {
  const factory Player({
    required PlayerType type,
    @Default(0) int score,
  }) = _Player;

  const Player._();

  String get symbol => type == PlayerType.x ? 'X' : 'O';

  Color get color => type == PlayerType.x ? GameColors.red : GameColors.green;
}
