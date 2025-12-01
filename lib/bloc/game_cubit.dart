import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/models.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit() : super(const GameState());

  static const List<List<int>> _winPatterns = [
    [0, 1, 2], // Top row
    [3, 4, 5], // Middle row
    [6, 7, 8], // Bottom row
    [0, 3, 6], // Left column
    [1, 4, 7], // Middle column
    [2, 5, 8], // Right column
    [0, 4, 8], // Diagonal
    [2, 4, 6], // Anti-diagonal
  ];

  void cellTapped(int index) {
    if (state.isGameOver || state.board[index] != null) {
      return;
    }

    final newBoard = List<PlayerType?>.from(state.board);
    newBoard[index] = state.currentPlayer;

    final winResult = _checkWin(newBoard);

    if (winResult != null) {
      final isXWinner = state.currentPlayer == PlayerType.x;
      emit(state.copyWith(
        board: newBoard,
        status: isXWinner ? GameStatus.xWins : GameStatus.oWins,
        xScore: isXWinner ? state.xScore + 1 : state.xScore,
        oScore: !isXWinner ? state.oScore + 1 : state.oScore,
        winningCells: winResult,
      ));
    } else if (!newBoard.contains(null)) {
      emit(state.copyWith(
        board: newBoard,
        status: GameStatus.draw,
      ));
    } else {
      emit(state.copyWith(
        board: newBoard,
        currentPlayer:
            state.currentPlayer == PlayerType.x ? PlayerType.o : PlayerType.x,
      ));
    }
  }

  List<int>? _checkWin(List<PlayerType?> board) {
    for (final pattern in _winPatterns) {
      final a = board[pattern[0]];
      final b = board[pattern[1]];
      final c = board[pattern[2]];

      if (a != null && a == b && b == c) {
        return pattern;
      }
    }
    return null;
  }

  void resetGame() {
    emit(state.copyWith(
      board: List.filled(9, null),
      currentPlayer: PlayerType.x,
      status: GameStatus.playing,
      winningCells: [],
    ));
  }

  void newGame() {
    emit(const GameState());
  }

  void resetScores() {
    emit(state.copyWith(
      xScore: 0,
      oScore: 0,
    ));
  }
}
