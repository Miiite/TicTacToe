import 'package:mocktail/mocktail.dart';
import 'package:tictactoe/features/game/models/player.dart';
import 'package:tictactoe/features/game_score/use_cases/game_score_use_cases.dart';

class MockPlayer extends Mock implements Player {}

class MockGetGameScoreUseCase extends Mock implements GetGameScoreUseCase {}

class MockSaveGameScoreUseCase extends Mock implements SaveGameScoreUseCase {}
