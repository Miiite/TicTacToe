import 'package:tictactoe/features/menu/views/new_game_screen.dart';
import 'package:tictactoe/navigation/app_route.dart';

class MenuRoute extends AppRoute {
  MenuRoute()
    : super(
        path: '/',
        viewBuilder: (_, __) => const NewGameScreen(),
      );
}
