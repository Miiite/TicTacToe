import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tictactoe/features/game/models/game_score.dart';

class GameScorePersistenceService {
  static const _gameScoreKey = 'game_score';

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
