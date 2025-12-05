import 'package:tictactoe/features/game/views/game_screen.dart';
import 'package:tictactoe/navigation/app_route.dart';

class GameRoute extends AppRoute {
  GameRoute()
    : super(
        path: '/$route',
        viewBuilder: (_, __) => GameScreen(),
      );

  static String get route => 'game';
}
