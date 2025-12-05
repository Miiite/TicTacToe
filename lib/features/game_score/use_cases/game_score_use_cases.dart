import 'package:tictactoe/features/game_score/models/game_score.dart';
import 'package:tictactoe/features/game_score/repositories/game_score_repository.dart';

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

  Future<GameScore> call() async {
    final score = await gameScoreRepository.getLatestGameScore();

    return score ?? GameScore(playerXScore: 0, playerOScore: 0);
  }
}
