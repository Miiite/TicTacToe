import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoe/extensions/player_type_extensions.dart';

part 'player.freezed.dart';

enum ActionType {
  x('X'),
  o('O')
  ;

  const ActionType(this.symbol);

  final String symbol;
}

@freezed
sealed class Player with _$Player {
  const factory Player({
    required ActionType type,
    @Default(0) int score,
  }) = _Player;

  const Player._();

  String get symbol => type.symbol;

  Color get color => type.color;
}
