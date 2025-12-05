import 'package:tictactoe/features/game/models/player.dart';

extension ActionTypeExtensions on ActionType {
  ActionType nextTurn() => switch (this) {
    ActionType.x => ActionType.o,
    ActionType.o => ActionType.x,
  };
}
