import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tictactoe/features/game/models/game_board.dart';
import 'package:tictactoe/features/game/models/game_score.dart';
import 'package:tictactoe/features/game/models/player.dart';

class GamePersistenceService {
  static const _gameBoardKey = 'game_board';
  static const _gameScoreKey = 'game_score';

  Future<void> saveGameStatus(GameBoard gameBoard) async {
    final prefs = await SharedPreferences.getInstance();
    final json = gameBoard.map((e) => e?.name).toList();
    await prefs.setString(_gameBoardKey, jsonEncode(json));
  }

  Future<GameBoard?> getLatestGameStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_gameBoardKey);
    if (jsonString == null) return null;

    final List<dynamic> json = jsonDecode(jsonString);
    return json
        .map((e) => e == null ? null : ActionType.values.byName(e as String))
        .toList();
  }

  Future<void> saveGameScore(GameScore score) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_gameScoreKey, jsonEncode(score.toJson()));
  }

  Future<GameScore?> getGameScore() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_gameScoreKey);
    if (jsonString == null) return null;

    return GameScore.fromJson(jsonDecode(jsonString));
  }
}
