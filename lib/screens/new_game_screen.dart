import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tictactoe/bloc/game_cubit.dart';
import 'package:tictactoe/utils/game_colors.dart';

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
            Text(
              'TIC',
              style: TextStyle(
                fontSize: 48,
                fontWeight: .w300,
                color: Colors.white.withAlpha(230),
                letterSpacing: 8,
              ),
            ),
            const SizedBox(width: 12),
            Container(
              padding: const .all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFE63946),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'X',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: .bold,
                  color: Colors.white,
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
              child: const Text(
                'O',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: .bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'TAC TOE',
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
  const _PlayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<GameCubit>().newGameRound();
      },
      child: Container(
        padding: const .symmetric(
          horizontal: 64,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFE63946), Color(0xFFFF6B6B)],
          ),
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFE63946).withAlpha(100),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.play_arrow_rounded,
              color: Colors.white,
              size: 32,
            ),
            const SizedBox(width: 8),
            Text(
              'NEW GAME',
              style: TextStyle(
                fontSize: 20,
                fontWeight: .w600,
                color: Colors.white,
                letterSpacing: 2,
                shadows: [
                  Shadow(
                    color: Colors.black.withAlpha(50),
                    offset: const Offset(0, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Illustration extends StatelessWidget {
  const _Illustration();

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.15,
      child: SizedBox(
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
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
            );
          },
        ),
      ),
    );
  }
}
