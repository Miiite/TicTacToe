import 'package:tictactoe/features/game_score/models/game_score.dart';
import 'package:tictactoe/features/game_score/sources/game_score_persistence_service.dart';

class GameScoreRepository {
  GameScoreRepository({
    required this.persistenceService,
  });

  final GameScorePersistenceService persistenceService;

  Future<void> saveGameScore(GameScore score) {
    return persistenceService.saveGameScore(score);
  }

  Future<GameScore?> getLatestGameScore() async {
    return persistenceService.getGameScore();
  }
}
