import 'package:tictactoe/features/game/models/game_result.dart';
import 'package:tictactoe/features/result/views/result_screen.dart';
import 'package:tictactoe/navigation/app_route.dart';

class ResultRoute extends AppRoute {
  ResultRoute()
    : super(
        path: '/$route',
        viewBuilder: (context, state) => ResultScreen(
          result: state.extra as GameResult?,
        ),
      );

  static String get route => 'result';
}
