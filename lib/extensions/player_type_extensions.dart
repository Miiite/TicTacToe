import 'package:tictactoe/models/player.dart';

extension PlayerTypeExtensions on PlayerType {
  PlayerType nextTurn() => switch (this) {
    PlayerType.x => PlayerType.o,
    PlayerType.o => PlayerType.x,
  };
}
