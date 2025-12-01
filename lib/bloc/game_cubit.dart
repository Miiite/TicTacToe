import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoe/models/player.dart';

part 'game_cubit.freezed.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit()
    : super(
        GameState.initial(
          xPlayer: Player(type: PlayerType.x),
          oPlayer: Player(type: PlayerType.o),
        ),
      );

  static const int gridSize = 9;
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
            ),
          );
        } else {
          final winnerType = newState.getWinnerType();

          emit(
            GameState.result(
              oPlayer: state.oPlayer.copyWith(
                score:
                    state.oPlayer.score + (winnerType == PlayerType.o ? 1 : 0),
              ),
              xPlayer: state.xPlayer.copyWith(
                score:
                    state.xPlayer.score + (winnerType == PlayerType.x ? 1 : 0),
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
    required List<PlayerType?> board,
    required Player xPlayer,
    required Player oPlayer,
  }) = _Game;
  factory GameState.result({
    Player? winner,
    required Player xPlayer,
    required Player oPlayer,
  }) = Result;
}

extension ResultExtensions on Result {
  bool get isXWinner => winner?.type == PlayerType.x;
  bool get isOWinner => winner?.type == PlayerType.o;
  bool get isDraw => winner == null;
}

extension on _Game {
  bool get isGameOver {
    return getWinnerType() != null || isDraw;
  }

  bool get isDraw {
    return board.every((cell) => cell != null);
  }

  PlayerType? getWinnerType() {
    for (final pattern in GameCubit.winPatterns) {
      final values = pattern.map((index) => board[index]).toList();
      if (values.every((cell) => cell == PlayerType.x)) {
        return PlayerType.x;
      } else if (values.every((cell) => cell == PlayerType.o)) {
        return PlayerType.o;
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
