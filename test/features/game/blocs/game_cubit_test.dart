import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tictactoe/features/game/blocs/game_cubit.dart';
import 'package:tictactoe/features/game/models/game_result.dart';
import 'package:tictactoe/features/game/models/game_score.dart';
import 'package:tictactoe/features/game/models/player.dart';

import '../../../mocks.dart';

void main() {
  late final xPlayer = Player(type: ActionType.x);
  late final oPlayer = Player(type: ActionType.o);
  late MockSaveGameStatusUseCase mockSaveGameStatusUseCase;
  late MockGetLatestGameStatusUseCase mockGetLatestGameStatusUseCase;
  late MockGetGameScoreUseCase mockGetGameScoreUseCase;
  late MockSaveGameScoreUseCase mockSaveGameScoreUseCase;

  setUpAll(() {
    registerFallbackValue(
      GameScore(
        playerXScore: 0,
        playerOScore: 0,
      ),
    );
  });

  setUp(() {
    mockSaveGameStatusUseCase = MockSaveGameStatusUseCase();
    mockGetLatestGameStatusUseCase = MockGetLatestGameStatusUseCase();
    mockGetGameScoreUseCase = MockGetGameScoreUseCase();
    mockSaveGameScoreUseCase = MockSaveGameScoreUseCase();

    when(
      () => mockGetGameScoreUseCase(),
    ).thenAnswer((_) async => GameScore(playerXScore: 0, playerOScore: 0));

    when(
      () => mockSaveGameScoreUseCase(any<GameScore>()),
    ).thenAnswer((_) async => Future.value());
  });

  group('GameCubit', () {
    test(
      'When creating the gameCubit it should be in an initial state by default',
      () async {
        final cubit = GameCubit(
          saveGameStatusUseCase: mockSaveGameStatusUseCase,
          getLatestGameStatusUseCase: mockGetLatestGameStatusUseCase,
          getGameScoreUseCase: mockGetGameScoreUseCase,
          saveGameScoreUseCase: mockSaveGameScoreUseCase,
        );

        await cubit.load();
        expect(
          cubit.state,
          isA<GameState>()
              .having(
                (s) => s.xPlayer.type,
                'xPlayer',
                (p) => p == ActionType.x,
              )
              .having(
                (s) => s.oPlayer.type,
                'oPlayer',
                (p) => p == ActionType.o,
              ),
        );
      },
    );

    group('Game logic', () {
      blocTest<GameCubit, GameState>(
        'Starting a new game round should properly reset the grid',
        build: () => GameCubit(
          saveGameStatusUseCase: mockSaveGameStatusUseCase,
          getLatestGameStatusUseCase: mockGetLatestGameStatusUseCase,
          getGameScoreUseCase: mockGetGameScoreUseCase,
          saveGameScoreUseCase: mockSaveGameScoreUseCase,
        ),
        act: (cubit) => cubit.newGameRound(),
        expect: () => [
          isA<GameState>().having(
            (s) => s.board,
            'board',
            (List<ActionType?> board) => board.every((cell) => cell == null),
          ),
        ],
      );

      blocTest<GameCubit, GameState>(
        'Selecting a cell should fill it with the current player\'s symbol',
        build: () => GameCubit(
          saveGameStatusUseCase: mockSaveGameStatusUseCase,
          getLatestGameStatusUseCase: mockGetLatestGameStatusUseCase,
          getGameScoreUseCase: mockGetGameScoreUseCase,
          saveGameScoreUseCase: mockSaveGameScoreUseCase,
        ),
        // Seed a state to force the current player's turn
        seed: () => GameState(
          playing: xPlayer,
          board: List.filled(9, null),
          xPlayer: xPlayer,
          oPlayer: oPlayer,
        ),
        act: (cubit) => cubit.selectCell(0),
        expect: () => [
          isA<GameState>().having(
            (s) => s.board[0],
            'cell 0',
            ActionType.x,
          ),
        ],
      );

      blocTest<GameCubit, GameState>(
        'Selecting a cell should switch the turn to the other player',
        build: () => GameCubit(
          saveGameStatusUseCase: mockSaveGameStatusUseCase,
          getLatestGameStatusUseCase: mockGetLatestGameStatusUseCase,
          getGameScoreUseCase: mockGetGameScoreUseCase,
          saveGameScoreUseCase: mockSaveGameScoreUseCase,
        ),
        // Seed the state to force the current player's turn
        seed: () => GameState(
          playing: xPlayer,
          board: List.filled(9, null),
          xPlayer: xPlayer,
          oPlayer: oPlayer,
        ),
        act: (cubit) => cubit.selectCell(0),
        expect: () => [
          isA<GameState>().having(
            (s) => s.playing,
            'playing',
            oPlayer,
          ),
        ],
      );

      blocTest<GameCubit, GameState>(
        'When a player wins a game, the proper state should be emited',
        build: () => GameCubit(
          saveGameStatusUseCase: mockSaveGameStatusUseCase,
          getLatestGameStatusUseCase: mockGetLatestGameStatusUseCase,
          getGameScoreUseCase: mockGetGameScoreUseCase,
          saveGameScoreUseCase: mockSaveGameScoreUseCase,
        ),
        // Simulate an already running game state
        seed: () => GameState(
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
            (s) => s.result?.mapOrNull(
              winner: (w) => (w.winner.type, w.winner.score),
            ),
            'winner',
            (xPlayer.type, xPlayer.score + 1),
          ),
        ],
      );
    });
  });
}
