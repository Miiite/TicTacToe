import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tictactoe/bloc/game_cubit.dart';

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
        // This is specific to a game scenario.
        state.map(
          initial: (_) => router.go('/'),
          game: (game) => router.go('/game'),
          result: (result) => router.go('/result'),
        );
      },
      child: child,
    );
  }
}
