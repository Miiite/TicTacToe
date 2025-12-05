import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tictactoe/features/game/blocs/game_cubit.dart';
import 'package:tictactoe/features/game/models/player.dart';

class MockPlayer extends Mock implements Player {}

void main() {
  late final xPlayer = Player(type: ActionType.x);
  late final oPlayer = Player(type: ActionType.o);

  group('GameCubit', () {
    test(
      'When creating the gameCubit it should be in an initial state by default',
      () {
        final cubit = GameCubit();
        expect(
          cubit.state,
          isA<GameState>()
              .having(
                (s) => s.mapOrNull(initial: (i) => i.xPlayer.type),
                'xPlayer',
                (p) => p == ActionType.x,
              )
              .having(
                (s) => s.mapOrNull(initial: (i) => i.oPlayer.type),
                'oPlayer',
                (p) => p == ActionType.o,
              ),
        );
      },
    );

    group('Game logic', () {
      blocTest<GameCubit, GameState>(
        'Starting a new game round should properly reset the grid',
        build: () => GameCubit(),
        act: (cubit) => cubit.newGameRound(),
        expect: () => [
          isA<GameState>().having(
            (s) => s.mapOrNull(game: (g) => g.board),
            'board',
            (List<ActionType?> board) => board.every((cell) => cell == null),
          ),
        ],
      );

      blocTest<GameCubit, GameState>(
        'Cannot select a cell, until the game has actually started',
        build: () => GameCubit(),
        act: (cubit) => cubit.selectCell(0),
        expect: () => [],
      );

      blocTest<GameCubit, GameState>(
        'Selecting a cell should fill it with the current player\'s symbol',
        build: () => GameCubit(),
        // Seed a state to force the current player's turn
        seed: () => GameState.game(
          playing: xPlayer,
          board: List.filled(9, null),
          xPlayer: xPlayer,
          oPlayer: oPlayer,
        ),
        act: (cubit) => cubit.selectCell(0),
        expect: () => [
          isA<GameState>().having(
            (s) => s.mapOrNull(game: (g) => g.board[0]),
            'cell 0',
            ActionType.x,
          ),
        ],
      );

      blocTest<GameCubit, GameState>(
        'Selecting a cell should switch the turn to the other player',
        build: () => GameCubit(),
        // Seed the state to force the current player's turn
        seed: () => GameState.game(
          playing: xPlayer,
          board: List.filled(9, null),
          xPlayer: xPlayer,
          oPlayer: oPlayer,
        ),
        act: (cubit) => cubit.selectCell(0),
        expect: () => [
          isA<GameState>().having(
            (s) => s.mapOrNull(game: (g) => g.playing),
            'playing',
            oPlayer,
          ),
        ],
      );

      blocTest<GameCubit, GameState>(
        'Creating a new game should reset the cubit\'s state to the initial state',
        build: () => GameCubit(),
        // Simulate an already running game state
        seed: () => GameState.game(
          playing: xPlayer,
          board: List.filled(9, null),
          xPlayer: xPlayer,
          oPlayer: oPlayer,
        ),
        act: (cubit) => cubit.newGame(),
        expect: () => [
          isA<GameState>().having(
            (s) => s.mapOrNull(initial: (i) => true),
            'initial state',
            true,
          ),
        ],
      );

      blocTest<GameCubit, GameState>(
        'When a player wins a game, the proper state should be emited',
        build: () => GameCubit(),
        // Simulate an already running game state
        seed: () => GameState.game(
          playing: xPlayer,
          board: <ActionType?>[
            ActionType.x,
            ActionType.x,
            null,
            ActionType.o,
            ActionType.x,
            ActionType.o,
            ActionType.x,
            ActionType.o,
            ActionType.o,
          ],
          xPlayer: xPlayer,
          oPlayer: oPlayer,
        ),
        act: (cubit) => cubit.selectCell(2),
        expect: () => [
          isA<GameState>().having(
            (s) => s.mapOrNull(result: (r) => r.winner),
            'winner',
            xPlayer,
          ),
        ],
      );
    });
  });
}
