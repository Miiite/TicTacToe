import 'package:tictactoe/features/game/models/game_score.dart';
import 'package:tictactoe/features/game/repositories/game_score_repository.dart';

class SaveGameScoreUseCase {
  SaveGameScoreUseCase({
    required this.gameScoreRepository,
  });

  final GameScoreRepository gameScoreRepository;

  Future<void> call(GameScore score) {
    return gameScoreRepository.saveGameScore(score);
  }
}

class GetGameScoreUseCase {
  GetGameScoreUseCase({
    required this.gameScoreRepository,
  });

  final GameScoreRepository gameScoreRepository;

  Future<GameScore?> call() {
    return gameScoreRepository.getLatestGameScore();
  }
}
