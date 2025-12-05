import 'package:tictactoe/features/game/models/game_board.dart';
import 'package:tictactoe/features/game/services/game_status_persistence_service.dart';

class GameStatusRepository {
  GameStatusRepository({
    required this.persistenceService,
  });

  final GameStatusPersistenceService persistenceService;

  Future<void> saveGameStatus(GameBoard gameBoard) {
    return persistenceService.saveGameStatus(gameBoard);
  }

  Future<GameBoard?> getLatestGameStatus() async {
    return persistenceService.getLatestGameStatus();
  }
}
