import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tictactoe/bloc/game_cubit.dart';
import 'package:tictactoe/widgets/game_cell.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0D1B2A),
              Color(0xFF1B263B),
              Color(0xFF415A77),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                // Header with back button
                Row(
                  children: [
                    IconButton(
                      onPressed: () => context.go('/'),
                      icon: const Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.white70,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'TIC TAC TOE',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withAlpha(180),
                        letterSpacing: 4,
                      ),
                    ),
                    const Spacer(),
                    const SizedBox(width: 48), // Balance
                  ],
                ),
                const SizedBox(height: 32),
                // Score cards
                BlocBuilder<GameCubit, GameState>(
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildScoreCard(
                          'X',
                          99,
                          const Color(0xFFE63946),
                          isActive: false,
                        ),
                        _buildScoreCard(
                          'O',
                          99,
                          const Color(0xFF4ECDC4),
                          isActive: false,
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 16),
                // Turn indicator
                BlocBuilder<GameCubit, GameState>(
                  builder: (context, state) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(15),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        'XXXXXX',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withAlpha(200),
                        ),
                      ),
                    );
                  },
                ),
                const Spacer(),
                // Game grid
                BlocBuilder<GameCubit, GameState>(
                  builder: (context, state) {
                    final gameBoard = state.mapOrNull(
                      game: (game) => game.board,
                    );

                    return AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.black.withAlpha(50),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: Colors.white.withAlpha(15),
                            width: 1,
                          ),
                        ),
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                              ),
                          itemCount: 9,
                          itemBuilder: (context, index) {
                            return GameCell(
                              index: index,
                              value: gameBoard?[index],
                              isWinningCell: false,
                              isGameOver: false,
                              onTap: () {
                                context.read<GameCubit>().cellTapped(index);
                              },
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
                const Spacer(),
                // Reset button
                TextButton.icon(
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
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildScoreCard(
    String symbol,
    int score,
    Color color, {
    required bool isActive,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isActive
              ? [color.withAlpha(75), color.withAlpha(50)]
              : [Colors.white.withAlpha(13), Colors.white.withAlpha(8)],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isActive ? color.withAlpha(130) : Colors.white.withAlpha(25),
          width: isActive ? 2 : 1,
        ),
        boxShadow: isActive
            ? [
                BoxShadow(
                  color: color.withAlpha(50),
                  blurRadius: 16,
                  spreadRadius: 2,
                ),
              ]
            : null,
      ),
      child: Column(
        children: [
          Text(
            symbol,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: color,
              shadows: [
                Shadow(
                  color: color.withAlpha(130),
                  blurRadius: 8,
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '$score',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.white.withAlpha(230),
            ),
          ),
        ],
      ),
    );
  }
}
