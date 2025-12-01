import 'dart:ui';

import 'package:tictactoe/models/player.dart';
import 'package:tictactoe/utils/game_colors.dart';

extension PlayerTypeExtensions on PlayerType {
  PlayerType nextTurn() => switch (this) {
    PlayerType.x => PlayerType.o,
    PlayerType.o => PlayerType.x,
  };

  Color get color => switch (this) {
    PlayerType.x => GameColors.red,
    PlayerType.o => GameColors.green,
  };
}
