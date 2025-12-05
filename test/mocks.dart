import 'package:mocktail/mocktail.dart';
import 'package:tictactoe/features/game/models/player.dart';
import 'package:tictactoe/features/game/use_cases/game_score_use_cases.dart';
import 'package:tictactoe/features/game/use_cases/game_status_use_cases.dart';

class MockPlayer extends Mock implements Player {}

class MockSaveGameStatusUseCase extends Mock implements SaveGameStatusUseCase {}

class MockGetLatestGameStatusUseCase extends Mock
    implements GetLatestGameStatusUseCase {}

class MockGetGameScoreUseCase extends Mock implements GetGameScoreUseCase {}

class MockSaveGameScoreUseCase extends Mock implements SaveGameScoreUseCase {}