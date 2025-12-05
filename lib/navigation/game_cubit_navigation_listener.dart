import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tictactoe/features/game/blocs/game_cubit.dart';
import 'package:tictactoe/features/game/navigation/route.dart';
import 'package:tictactoe/features/result/navigation/route.dart';

class GameCubitNavigationListener extends StatelessWidget {
  const GameCubitNavigationListener({
    super.key,
    required this.child,
    required this.router,
  });

  final Widget child;
  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    return BlocListener<GameCubit, GameState>(
      listener: (context, state) {
        // Don't push the pages, to stay in control of the navigation stack
        // This is specific to a game
        state.map(
          initial: (_) => router.go('/'),
          game: (game) => router.go('/${GameRoute.route}'),
          result: (result) {
            // We don't want to navigate to the result screen immediately,
            // because we want to let the users see that the game is over
            // before navigating away from the game screen.
            Future.delayed(const Duration(milliseconds: 500), () {
              router.go('/${ResultRoute.route}');
            });
          },
        );
      },
      child: child,
    );
  }
}
