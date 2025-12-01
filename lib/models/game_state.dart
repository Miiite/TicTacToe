import 'package:freezed_annotation/freezed_annotation.dart';
import 'player.dart';

part 'game_state.freezed.dart';

enum GameStatus { playing, xWins, oWins, draw }

@freezed
class GameState with _$GameState {
  const factory GameState({
    @Default([null, null, null, null, null, null, null, null, null])
    List<PlayerType?> board,
    @Default(PlayerType.x) PlayerType currentPlayer,
    @Default(GameStatus.playing) GameStatus status,
    @Default(0) int xScore,
    @Default(0) int oScore,
    @Default([]) List<int> winningCells,
  }) = _GameState;

  const GameState._();

  bool get isGameOver => status != GameStatus.playing;

  String get currentPlayerSymbol => currentPlayer == PlayerType.x ? 'X' : 'O';

  String get statusMessage {
    switch (status) {
      case GameStatus.playing:
        return "Player $currentPlayerSymbol's turn";
      case GameStatus.xWins:
        return 'Player X wins!';
      case GameStatus.oWins:
        return 'Player O wins!';
      case GameStatus.draw:
        return "It's a draw!";
    }
  }
}
