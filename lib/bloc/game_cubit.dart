import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoe/models/player.dart';

part 'game_cubit.freezed.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit() : super(GameState.initial());

  void cellTapped(int index) {
    final newState = state.mapOrNull(
      game: ((game) {
        game.board?[index] = game.playerTurn;
        return game.copyWith(
          board: game.board,
        );
      }),
    );

    if (newState case final newState?) {
      emit(newState);
    }
  }

  void resetGame() {
    emit(
      GameState.game(
        playerTurn: PlayerType.x,
      ),
    );
  }

  void newGame() {
    resetGame();
  }
}

@freezed
class GameState with _$GameState {
  factory GameState.initial() = _Initial;
  factory GameState.game({
    required PlayerType playerTurn,
    List<PlayerType?>? board,
    @Default(0) int xScore,
    @Default(0) int oScore,
  }) = _Game;
  factory GameState.result({
    @Default(0) int xScore,
    @Default(0) int oScore,
  }) = _Result;
}
