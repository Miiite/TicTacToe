import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tictactoe/bloc/game_cubit.dart';

class GameCubitNavigationListener extends StatelessWidget {
  const GameCubitNavigationListener({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<GameCubit, GameState>(
      listener: (context, state) {
        state.map(
          initial: (_) => context.go('/'),
          game: (game) => context.go('/game'),
          result: (result) => context.go('/result'),
        );
      },
      child: child,
    );
  }
}
