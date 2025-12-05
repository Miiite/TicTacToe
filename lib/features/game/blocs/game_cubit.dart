import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoe/features/game/models/game_board.dart';
import 'package:tictactoe/features/game/models/game_result.dart';
import 'package:tictactoe/features/game/models/game_score.dart';
import 'package:tictactoe/features/game/models/player.dart';
import 'package:tictactoe/features/game/use_cases/game_score_use_cases.dart';
import 'package:tictactoe/widgets/cubit_loader.dart';

part 'game_cubit.freezed.dart';

class GameCubit extends LoadableCubit<GameState> {
  GameCubit({
    required this.saveGameScoreUseCase,
    required this.getGameScoreUseCase,
  }) : super(
         initialState: GameState(
           xPlayer: Player(type: ActionType.x),
           oPlayer: Player(type: ActionType.o),
           board: _emptyBoard,
         ),
       );

  static const int gridSize = 9;
  static final List<ActionType?> _emptyBoard = List.filled(gridSize, null);

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

  final SaveGameScoreUseCase saveGameScoreUseCase;
  final GetGameScoreUseCase getGameScoreUseCase;

  @override
  Future<void> load() async {
    newGameRound();

    final gameScore = await getGameScoreUseCase();

    emit(
      state.copyWith(
        oPlayer: state.oPlayer.copyWith(score: gameScore?.playerOScore ?? 0),
        xPlayer: state.xPlayer.copyWith(score: gameScore?.playerXScore ?? 0),
      ),
    );
  }

  Future<void> selectCell(int index) async {
    final newState = state.selectCell(index);
    final winnerType = newState.getWinnerType();

    // Game is over and has a winner
    if (winnerType != null) {
      final stateWithUpdatedScore = state.copyWith(
        oPlayer: state.oPlayer.copyWith(
          score: state.oPlayer.score + (winnerType == ActionType.o ? 1 : 0),
        ),
        xPlayer: state.xPlayer.copyWith(
          score: state.xPlayer.score + (winnerType == ActionType.x ? 1 : 0),
        ),
      );

      await saveGameScoreUseCase(
        GameScore(
          playerXScore: stateWithUpdatedScore.xPlayer.score,
          playerOScore: stateWithUpdatedScore.oPlayer.score,
        ),
      );

      emit(
        stateWithUpdatedScore.copyWith(
          result: GameResult.winner(
            winner: winnerType == ActionType.x
                ? stateWithUpdatedScore.xPlayer
                : stateWithUpdatedScore.oPlayer,
          ),
        ),
      );
      return;
    }

    // Game is over and is a draw
    if (newState.isDraw) {
      emit(
        state.copyWith(
          result: GameResult.draw(),
        ),
      );

      return;
    }

    // Game is not over yet
    emit(newState.nextTurn());
  }

  void newGameRound() {
    emit(
      GameState(
        playing: random.nextBool() ? state.xPlayer : state.oPlayer,
        board: _emptyBoard,
        oPlayer: state.oPlayer,
        xPlayer: state.xPlayer,
      ),
    );
  }
}

@freezed
sealed class GameState with _$GameState {
  factory GameState({
    required GameBoard board,
    required Player xPlayer,
    required Player oPlayer,
    Player? playing,
    GameResult? result,
  }) = _Game;
}

extension on GameState {
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

  GameState selectCell(int index) {
    final localPlaying = playing;
    if (localPlaying == null) {
      return this;
    }

    return copyWith(
      board: List.from(board)..[index] = localPlaying.type,
    );
  }

  GameState nextTurn() {
    final localPlaying = playing;

    if (localPlaying == null) {
      return this;
    }

    return copyWith(
      playing: localPlaying.type == xPlayer.type ? oPlayer : xPlayer,
    );
  }
}
