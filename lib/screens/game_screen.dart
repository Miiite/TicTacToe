import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tictactoe/bloc/game_cubit.dart';
import 'package:tictactoe/models/player.dart';
import 'package:tictactoe/utils/game_colors.dart';
import 'package:tictactoe/widgets/game_cell.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentColorGradient = context.select((GameCubit cubit){
      return cubit.state.maybeMap(
        game: (value) {
          return switch(value.playerTurn){
            PlayerType.x => GameColors.redGradient,
            PlayerType.o => GameColors.greenGradient,
          };
        },
        orElse: () => GameColors.backgroundGradient,
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('TIC TAC TOE'),
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: currentColorGradient,
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
                _ScoreCards(),
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
    return BlocBuilder<GameCubit, GameState>(
      buildWhen: (previous, current) {
        return current.mapOrNull(
              game: (game) => game.board,
            ) !=
            null;
      },
      builder: (context, state) {
        final gameBoard = state.mapOrNull(
          game: (game) => game.board,
        );

        return AspectRatio(
          aspectRatio: 1,
          child: Container(
            padding: const .all(12),
            decoration: BoxDecoration(
              color: Colors.black.withAlpha(50),
              borderRadius: BorderRadius.circular(24),
              border: .all(
                color: Colors.white.withAlpha(15),
                width: 1,
              ),
            ),
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
                  value: gameBoard?[index],
                  isGameOver: false,
                  onTap: () {
                    context.read<GameCubit>().selectCell(index);
                  },
                );
              },
            ),
          ),
        );
      },
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

class _ScoreCards extends StatelessWidget {
  const _ScoreCards();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameCubit, GameState>(
      buildWhen: (previous, current) =>
          current.mapOrNull(
            game: (value) => value,
          ) !=
          null,
      builder: (context, state) {
        final xPlayer = state.mapOrNull(game: (value) => value.xPlayer);
        final oPlayer = state.mapOrNull(game: (value) => value.oPlayer);

        return Row(
          mainAxisAlignment: .spaceEvenly,
          children: [
            if (xPlayer != null)
              _ScoreCard(
                player: xPlayer,
              ),
            if (oPlayer != null)
              _ScoreCard(
                player: oPlayer,
              ),
          ],
        );
      },
    );
  }
}

class _ScoreCard extends StatelessWidget {
  const _ScoreCard({
    required this.player,
  });

  final Player player;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const .symmetric(horizontal: 32, vertical: 16),
      decoration: BoxDecoration(
        gradient: GameColors.cellGradient,
        borderRadius: BorderRadius.circular(20),
        border: .all(
          color: Colors.white.withAlpha(25),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Text(
            player.symbol,
            style: TextStyle(
              fontSize: 28,
              fontWeight: .bold,
              color: player.color,
              shadows: [
                Shadow(
                  color: player.color.withAlpha(130),
                  blurRadius: 8,
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '${player.score}',
            style: TextStyle(
              fontSize: 24,
              fontWeight: .w600,
              color: Colors.white.withAlpha(230),
            ),
          ),
        ],
      ),
    );
  }
}
