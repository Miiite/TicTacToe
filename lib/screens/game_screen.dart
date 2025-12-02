import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tictactoe/bloc/game_cubit.dart';
import 'package:tictactoe/models/player.dart';
import 'package:tictactoe/utils/game_colors.dart';
import 'package:tictactoe/widgets/animated_score_summary.dart';
import 'package:tictactoe/widgets/game_cell.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final backgroundGradient = context.select((GameCubit cubit) {
      return cubit.state.maybeMap(
        game: (value) {
          return switch (value.playing.type) {
            ActionType.x => GameColors.redGradient,
            ActionType.o => GameColors.greenGradient,
          };
        },
        orElse: () => GameColors.backgroundGradient,
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TIC TAC TOE',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: .bold,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: backgroundGradient,
        ),
        child: SafeArea(
          child: Padding(
            padding: const .all(24.0),
            child: Column(
              children: [
                Padding(
                  padding: .only(top: 16),
                  child: _GameBoard(),
                ),
                const Spacer(),
                AnimatedScoreSummary(
                  duration: .zero,
                  backgroundColor: const Color(0xFF2D3E50),
                ),
                const Spacer(),
                _ResetBoardButton(),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GameBoard extends StatelessWidget {
  const _GameBoard();

  @override
  Widget build(BuildContext context) {
    final gameBoard = context.select((GameCubit cubit) {
      return cubit.state.mapOrNull(
        game: (game) => game.board,
        result: (result) => result.board,
      );
    });

    return AspectRatio(
      aspectRatio: 1,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.black.withAlpha(50),
          borderRadius: .circular(24),
          border: .all(
            color: Colors.white.withAlpha(15),
            width: 1,
          ),
        ),
        child: Padding(
          padding: const .all(12),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: 9,
            itemBuilder: (context, index) {
              return GameCell(
                index: index,
                playerType: gameBoard?[index],
                onTap: () {
                  context.read<GameCubit>().selectCell(index);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class _ResetBoardButton extends StatelessWidget {
  const _ResetBoardButton();

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        context.read<GameCubit>().resetGame();
      },
      icon: const Icon(
        Icons.refresh_rounded,
        color: Colors.white54,
      ),
      label: Text(
        'RESET BOARD',
        style: TextStyle(
          color: Colors.white.withAlpha(140),
          letterSpacing: 1,
        ),
      ),
    );
  }
}
