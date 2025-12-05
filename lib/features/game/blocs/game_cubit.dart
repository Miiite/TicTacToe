import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoe/features/game/models/player.dart';

part 'game_cubit.freezed.dart';

typedef GameBoard = List<ActionType?>;

class GameCubit extends Cubit<GameState> {
  GameCubit()
    : super(
        GameState.initial(
          xPlayer: Player(type: ActionType.x),
          oPlayer: Player(type: ActionType.o),
        ),
      );

  static const int gridSize = 9;

  // OK for small grid sizes, but should be dynamic if we were to make
  // a bigger titactoe board game.
  static const List<List<int>> winPatterns = [
    [0, 1, 2], // Top row
    [3, 4, 5], // Middle row
    [6, 7, 8], // Bottom row
    [0, 3, 6], // Left column
    [1, 4, 7], // Middle column
    [2, 5, 8], // Right column
    [0, 4, 8], // Diagonal
    [2, 4, 6], // Anti-diagonal
  ];

  final random = Random();

  void selectCell(int index) {
    state.mapOrNull(
      game: ((game) {
        final newState = game.selectCell(index);

        if (!newState.isGameOver) {
          emit(newState.nextTurn());
        } else if (newState.isDraw) {
          emit(
            GameState.result(
              oPlayer: state.oPlayer,
              xPlayer: state.xPlayer,
              board: newState.board,
            ),
          );
        } else {
          final winnerType = newState.getWinnerType();

          emit(
            GameState.result(
              board: newState.board,
              oPlayer: state.oPlayer.copyWith(
                score:
                    state.oPlayer.score + (winnerType == ActionType.o ? 1 : 0),
              ),
              xPlayer: state.xPlayer.copyWith(
                score:
                    state.xPlayer.score + (winnerType == ActionType.x ? 1 : 0),
              ),
              winner: winnerType == state.xPlayer.type
                  ? state.xPlayer
                  : state.oPlayer,
            ),
          );
        }
      }),
    );
  }

  void resetGame() {
    emit(
      GameState.game(
        playing: random.nextBool() ? state.xPlayer : state.oPlayer,
        board: List.filled(gridSize, null),
        oPlayer: state.oPlayer,
        xPlayer: state.xPlayer,
      ),
    );
  }

  void newGameRound() {
    emit(
      GameState.game(
        playing: random.nextBool() ? state.xPlayer : state.oPlayer,
        board: List.filled(gridSize, null),
        oPlayer: state.oPlayer,
        xPlayer: state.xPlayer,
      ),
    );
  }

  void newGame() {
    emit(
      GameState.initial(
        xPlayer: state.xPlayer,
        oPlayer: state.oPlayer,
      ),
    );
  }
}

@freezed
sealed class GameState with _$GameState {
  factory GameState.initial({
    required Player xPlayer,
    required Player oPlayer,
  }) = _Initial;
  factory GameState.game({
    required Player playing,
    required GameBoard board,
    required Player xPlayer,
    required Player oPlayer,
  }) = _Game;
  factory GameState.result({
    Player? winner,
    required Player xPlayer,
    required Player oPlayer,
    required GameBoard board,
  }) = Result;
}

extension ResultExtensions on Result {
  bool get isXWinner => winner?.type == ActionType.x;
  bool get isOWinner => winner?.type == ActionType.o;
  bool get isDraw => winner == null;
}

extension on _Game {
  bool get isGameOver {
    return getWinnerType() != null || isDraw;
  }

  bool get isDraw {
    return board.every((cell) => cell != null);
  }

  ActionType? getWinnerType() {
    for (final pattern in GameCubit.winPatterns) {
      final values = pattern.map((index) => board[index]).toList();
      if (values.every((cell) => cell == ActionType.x)) {
        return ActionType.x;
      } else if (values.every((cell) => cell == ActionType.o)) {
        return ActionType.o;
      }
    }

    return null;
  }

  _Game selectCell(int index) => copyWith(
    board: List.from(board)..[index] = playing.type,
  );

  _Game nextTurn() => copyWith(
    playing: playing == xPlayer ? oPlayer : xPlayer,
  );
}
