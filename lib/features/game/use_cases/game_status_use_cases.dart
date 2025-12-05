import 'package:tictactoe/features/game/models/game_board.dart';
import 'package:tictactoe/features/game/repositories/game_status_repository.dart';

class SaveGameStatusUseCase {
  SaveGameStatusUseCase({
    required this.gameStatusRepository,
  });

  final GameStatusRepository gameStatusRepository;

  Future<void> call(GameBoard gameBoard) async {
    return gameStatusRepository.saveGameStatus(gameBoard);
  }
}

class GetLatestGameStatusUseCase {
  GetLatestGameStatusUseCase({
    required this.gameStatusRepository,
  });

  final GameStatusRepository gameStatusRepository;

  Future<GameBoard?> call() async {
    return gameStatusRepository.getLatestGameStatus();
  }
}
