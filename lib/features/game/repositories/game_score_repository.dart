import 'package:tictactoe/features/game/models/game_score.dart';
import 'package:tictactoe/features/game/services/game_status_persistence_service.dart';

class GameScoreRepository {
  GameScoreRepository({
    required this.persistenceService,
  });

  final GamePersistenceService persistenceService;

  Future<void> saveGameScore(GameScore score) {
    return persistenceService.saveGameScore(score);
  }

  Future<GameScore?> getLatestGameScore() async {
    return persistenceService.getGameScore();
  }
}
