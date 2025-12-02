import 'dart:ui';

import 'package:tictactoe/models/player.dart';
import 'package:tictactoe/utils/game_colors.dart';

extension PlayerTypeExtensions on ActionType {
  ActionType nextTurn() => switch (this) {
    ActionType.x => ActionType.o,
    ActionType.o => ActionType.x,
  };

  Color get color => switch (this) {
    ActionType.x => GameColors.red,
    ActionType.o => GameColors.green,
  };
}
