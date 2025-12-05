import 'package:mocktail/mocktail.dart';
import 'package:tictactoe/features/game/models/player.dart';
import 'package:tictactoe/features/game/use_cases/game_status_use_cases.dart';

class MockPlayer extends Mock implements Player {}

class MockSaveGameStatusUseCase extends Mock implements SaveGameStatusUseCase {}

class MockGetLatestGameStatusUseCase extends Mock
    implements GetLatestGameStatusUseCase {}
