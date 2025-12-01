import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tictactoe/bloc/game_cubit.dart';
import 'package:tictactoe/models/player.dart';
import 'package:tictactoe/utils/game_colors.dart';
import 'package:tictactoe/widgets/main_button.dart';

class NewGameScreen extends StatelessWidget {
  const NewGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: GameColors.backgroundGradient,
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: .center,
              children: [
                _Title(),
                const SizedBox(height: 80),
                _PlayButton(),
                const SizedBox(height: 100),
                _Illustration(),
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
                color: const Color(0xFFE63946),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const .all(12),
                child: Text(
                  PlayerType.x.symbol.toUpperCase(),
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: .bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const .all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF4ECDC4),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                PlayerType.o.symbol.toUpperCase(),
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: .bold,
                  color: Colors.white,
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

class _PlayButton extends StatelessWidget {
  const _PlayButton();

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

class _Illustration extends HookWidget {
  const _Illustration();

  @override
  Widget build(BuildContext context) {
    final randomizer = useMemoized(() => Random());
    final selectedTile = useState(randomizer.nextInt(9));

    useEffect(() {
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
      return timer.cancel;
    }, const []);

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
          final isSelected = index == selectedTile.value;

          return AnimatedOpacity(
            opacity: isSelected ? 1.0 : 0.15,
            duration: Duration(milliseconds: isSelected ? 400 : 0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: isSelected
                    ? (selectedTile.value % 2 == 0
                          ? GameColors.red
                          : GameColors.green)
                    : Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          );
        },
      ),
    );
  }
}
