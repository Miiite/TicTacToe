import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tictactoe/bloc/game_cubit.dart';
import 'package:tictactoe/utils/game_colors.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
      ),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameCubit, GameState>(
      builder: (context, state) {
        final isXWinner = false;
        final isOWinner = false;
        final isDraw = false;

        final winnerColor = isXWinner
            ? const Color(0xFFE63946)
            : isOWinner
            ? const Color(0xFF4ECDC4)
            : Colors.white70;

        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: GameColors.backgroundGradient,
            ),
            child: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: .center,
                  children: [
                    // Animated result display
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: ScaleTransition(
                        scale: _scaleAnimation,
                        child: Column(
                          children: [
                            // Trophy or draw icon
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: RadialGradient(
                                  colors: [
                                    winnerColor.withAlpha(50),
                                    winnerColor.withAlpha(13),
                                  ],
                                ),
                                border: .all(
                                  color: winnerColor.withAlpha(100),
                                  width: 2,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: winnerColor.withAlpha(75),
                                    blurRadius: 30,
                                    spreadRadius: 5,
                                  ),
                                ],
                              ),
                              child: Icon(
                                isDraw
                                    ? Icons.handshake_rounded
                                    : Icons.emoji_events_rounded,
                                size: 60,
                                color: winnerColor,
                              ),
                            ),
                            const SizedBox(height: 32),
                            // Winner text
                            Text(
                              isDraw ? "IT'S A DRAW!" : 'WINNER!',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: .w500,
                                color: Colors.white.withAlpha(180),
                                letterSpacing: 4,
                              ),
                            ),
                            const SizedBox(height: 16),
                            // Winner symbol
                            if (!isDraw)
                              Container(
                                padding: const .symmetric(
                                  horizontal: 40,
                                  vertical: 20,
                                ),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      winnerColor.withAlpha(75),
                                      winnerColor.withAlpha(50),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                  border: .all(
                                    color: winnerColor.withAlpha(130),
                                    width: 2,
                                  ),
                                ),
                                child: Text(
                                  isXWinner ? 'X' : 'O',
                                  style: TextStyle(
                                    fontSize: 64,
                                    fontWeight: .bold,
                                    color: winnerColor,
                                    shadows: [
                                      Shadow(
                                        color: winnerColor.withAlpha(180),
                                        blurRadius: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 60),
                    // Score summary
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: Container(
                        padding: const .all(24),
                        margin: const .symmetric(horizontal: 48),
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha(13),
                          borderRadius: BorderRadius.circular(20),
                          border: .all(
                            color: Colors.white.withAlpha(25),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: .spaceEvenly,
                          children: [
                            _buildScoreSummary(
                              'X',
                              99,
                              const Color(0xFFE63946),
                            ),
                            Container(
                              width: 1,
                              height: 50,
                              color: Colors.white.withAlpha(50),
                            ),
                            _buildScoreSummary(
                              'O',
                              99,
                              const Color(0xFF4ECDC4),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 60),
                    // Action buttons
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: Column(
                        children: [
                          // Play Again button
                          GestureDetector(
                            onTap: () {
                              context.read<GameCubit>().resetGame();
                              context.go('/game');
                            },
                            child: Container(
                              padding: const .symmetric(
                                horizontal: 48,
                                vertical: 16,
                              ),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFFE63946),
                                    Color(0xFFFF6B6B),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(
                                      0xFFE63946,
                                    ).withAlpha(100),
                                    blurRadius: 20,
                                    offset: const Offset(0, 8),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.replay_rounded,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'PLAY AGAIN',
                                    style: TextStyle(
                                      fontSize: 16,
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
                          ),
                          const SizedBox(height: 16),
                          // Home button
                          TextButton.icon(
                            onPressed: () {
                              context.read<GameCubit>().newGame();
                              context.go('/');
                            },
                            icon: const Icon(
                              Icons.home_rounded,
                              color: Colors.white54,
                            ),
                            label: Text(
                              'BACK TO HOME',
                              style: TextStyle(
                                color: Colors.white.withAlpha(140),
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildScoreSummary(String symbol, int score, Color color) {
    return Column(
      children: [
        Text(
          symbol,
          style: TextStyle(
            fontSize: 24,
            fontWeight: .bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '$score',
          style: TextStyle(
            fontSize: 28,
            fontWeight: .w600,
            color: Colors.white.withAlpha(230),
          ),
        ),
      ],
    );
  }
}
