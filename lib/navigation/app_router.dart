import 'package:go_router/go_router.dart';
import 'package:tictactoe/features/game/navigation/route.dart';
import 'package:tictactoe/features/menu/navigation/route.dart';
import 'package:tictactoe/features/result/navigation/route.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      MenuRoute(),
      GameRoute(),
      ResultRoute(),
    ],
  );
}
