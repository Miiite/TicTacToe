import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tictactoe/design_system/design_system.dart';
import 'package:tictactoe/features/game/blocs/game_cubit.dart';
import 'package:tictactoe/features/game/models/player.dart';

class NewGameScreen extends StatelessWidget {
  const NewGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: AppTheme.of(context).backgroundGradient,
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: .center,
              children: [
                _Title(),
                const SizedBox(height: 80),
                _NewGameButton(),
                const SizedBox(height: 100),
                _AnimatedGrid(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: .center,
      mainAxisSize: .min,
      children: [
        Row(
          mainAxisAlignment: .center,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: AppTheme.of(context).red,
                borderRadius: .circular(8),
              ),
              child: Padding(
                padding: const .all(12),
                child: Text(
                  ActionType.x.symbol.toUpperCase(),
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: .bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            DecoratedBox(
              decoration: BoxDecoration(
                color: AppTheme.of(context).green,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const .all(12),
                child: Text(
                  ActionType.o.symbol.toUpperCase(),
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: .bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          'TIC TAC TOE',
          textAlign: .center,
          style: TextStyle(
            fontSize: 48,
            fontWeight: .w300,
            color: Colors.white.withAlpha(230),
            letterSpacing: 16,
          ),
        ),
      ],
    );
  }
}

class _NewGameButton extends StatelessWidget {
  const _NewGameButton();

  @override
  Widget build(BuildContext context) {
    return MainButton(
      onTap: () {
        context.read<GameCubit>().newGameRound();
      },
      icon: Icons.play_arrow_rounded,
      title: 'NEW GAME',
    );
  }
}

class _AnimatedGrid extends HookWidget {
  const _AnimatedGrid();

  @override
  Widget build(BuildContext context) {
    // Creates a Random object instance only once. After the first build,
    // it will return the same instance each time.
    final randomizer = useMemoized(() => Random());
    // Creates a state variable that will trigger a rebuild when its value changes.
    final selectedTile = useState(randomizer.nextInt(9));

    useEffect(
      () {
        final timer = Timer.periodic(
          const Duration(seconds: 1),
          (_) {
            int newSelectedTile = randomizer.nextInt(9);
            while (selectedTile.value == newSelectedTile) {
              newSelectedTile = randomizer.nextInt(9);
            }
            selectedTile.value = newSelectedTile;
          },
        );

        // This will cancel the running timer when the widget is disposed or if the useEffect callback
        // is called again (as per the docs)
        return timer.cancel;
      },
      // The key is mandatory to avoid re-creating the timer whenever the widget gets rebuilt
      // which will happen every time the timer ticks.
      [true],
    );

    return SizedBox(
      width: 120,
      height: 120,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
        ),
        itemCount: 9,
        itemBuilder: (context, index) {
          return _AnimatedGridItem(
            index: index,
            isSelected: selectedTile.value == index,
          );
        },
      ),
    );
  }
}

class _AnimatedGridItem extends StatelessWidget {
  const _AnimatedGridItem({
    required this.index,
    required this.isSelected,
  });

  final int index;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return AnimatedOpacity(
      opacity: isSelected ? 1.0 : 0.15,
      duration: Duration(milliseconds: isSelected ? 400 : 0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: isSelected
              ? (index.isEven ? theme.red : theme.green)
              : Colors.white,
          borderRadius: .circular(4),
        ),
      ),
    );
  }
}
