import 'package:tictactoe/features/result/views/result_screen.dart';
import 'package:tictactoe/navigation/app_route.dart';

class ResultRoute extends AppRoute {
  ResultRoute()
    : super(
        path: '/$route',
        child: const ResultScreen(),
      );

  static String get route => 'result';
}
