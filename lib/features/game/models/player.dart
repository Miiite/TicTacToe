import 'package:freezed_annotation/freezed_annotation.dart';

part 'player.freezed.dart';

enum ActionType {
  x('X'),
  o('O')
  ;

  const ActionType(this.symbol);

  final String symbol;
}

@freezed
abstract class Player with _$Player {
  const factory Player({
    required ActionType type,
    @Default(0) int score,
  }) = _Player;

  factory Player.x() => const Player(type: ActionType.x);
  factory Player.o() => const Player(type: ActionType.o);
}
