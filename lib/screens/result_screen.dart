import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_confetti/flutter_confetti.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tictactoe/bloc/game_cubit.dart';
import 'package:tictactoe/models/player.dart';
import 'package:tictactoe/utils/game_colors.dart';

const _animationDuration = Duration(milliseconds: 800);

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameCubit, GameState>(
      buildWhen: (previous, current) =>
          current.maybeMap(result: (value) => true, orElse: () => false),
      builder: (context, state) {
        return Scaffold(
          body: _ConfettiCanon(
            child: Container(
              decoration: BoxDecoration(
                gradient: GameColors.backgroundGradient,
              ),
              child: SafeArea(
                child: Center(
                  child: Column(
                    mainAxisAlignment: .center,
                    children: [
                      _GameResultMessage(),
                      const SizedBox(height: 60),
                      _AnimatedScoreSummary(),
                      const SizedBox(height: 60),
                      _ActionButtons(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ConfettiCanon extends StatefulWidget {
  const _ConfettiCanon({
    required this.child,
  });

  final Widget child;

  @override
  State<_ConfettiCanon> createState() => _ConfettiCanonState();
}

class _ConfettiCanonState extends State<_ConfettiCanon> {
  late final ConfettiController leftCanonController;
  late final ConfettiController rightCanonController;

  final confettiOptions = ConfettiOptions(
    particleCount: 100,
    spread: 70,
    startVelocity: 30,
    y: 0.5,
  );

  @override
  void initState() {
    super.initState();

    final isDraw = context.read<GameCubit>().state.maybeMap(
      result: (value) => value.isDraw,
      orElse: () => false,
    );

    Future.delayed(Duration(seconds: 1), () {
      final localContext = context;
      if (localContext.mounted) {
        leftCanonController = Confetti.launch(
          localContext,
          options: confettiOptions.copyWith(
            particleCount: isDraw ? 1 : 100,
            x: 0,
            angle: 60,
          ),
        );

        rightCanonController = Confetti.launch(
          localContext,
          options: confettiOptions.copyWith(
            particleCount: isDraw ? 1 : 100,
            x: 1,
            angle: 120,
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    leftCanonController.kill();
    rightCanonController.kill();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

class _GameResultMessage extends HookWidget {
  const _GameResultMessage();

  @override
  Widget build(BuildContext context) {
    final state = context.read<GameCubit>().state;
    final isXWinner = state.maybeMap(
      result: (value) => value.isXWinner,
      orElse: () => false,
    );
    final isOWinner = state.maybeMap(
      result: (value) => value.isOWinner,
      orElse: () => false,
    );
    final isDraw = state.maybeMap(
      result: (value) => value.isDraw,
      orElse: () => false,
    );

    final winnerColor = isXWinner
        ? const Color(0xFFE63946)
        : isOWinner
        ? const Color(0xFF4ECDC4)
        : Colors.white70;

    final controller = useAnimationController(
      duration: _animationDuration,
    );

    useEffect(
      () {
        controller.forward();
        return null;
      },
      [],
    );
    return FadeTransition(
      opacity: context.fadeAnimation(controller: controller),
      child: ScaleTransition(
        scale: context.scaleAnimation(controller: controller),
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
                isDraw ? Icons.handshake_rounded : Icons.emoji_events_rounded,
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
    );
  }
}

class _AnimatedScoreSummary extends HookWidget {
  const _AnimatedScoreSummary();

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: _animationDuration,
    );

    useEffect(
      () {
        controller.forward();
        return null;
      },
      [],
    );

    return FadeTransition(
      opacity: context.fadeAnimation(controller: controller),
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
            _XPlayerScore(),
            SizedBox(
              width: 1,
              height: 50,
              child: VerticalDivider(
                color: Colors.white.withAlpha(50),
                thickness: 1,
              ),
            ),
            _OPlayerScore(),
          ],
        ),
      ),
    );
  }
}

class _XPlayerScore extends StatelessWidget {
  const _XPlayerScore();

  @override
  Widget build(BuildContext context) {
    final score = context.select((GameCubit cubit) {
      return cubit.state.xPlayer.score;
    });

    return _ScoreSummary(
      symbol: PlayerType.x.symbol,
      score: score,
      color: const Color(0xFFE63946),
    );
  }
}

class _OPlayerScore extends StatelessWidget {
  const _OPlayerScore();

  @override
  Widget build(BuildContext context) {
    final score = context.select((GameCubit cubit) {
      return cubit.state.oPlayer.score;
    });

    return _ScoreSummary(
      symbol: PlayerType.o.symbol,
      score: score,
      color: const Color(0xFF4ECDC4),
    );
  }
}

class _ActionButtons extends HookWidget {
  const _ActionButtons();

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: _animationDuration,
    );

    useEffect(
      () {
        controller.forward();
        return null;
      },
      [],
    );

    return FadeTransition(
      opacity: context.fadeAnimation(controller: controller),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              context.read<GameCubit>().newGameRound();
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
          TextButton.icon(
            onPressed: () {
              context.read<GameCubit>().resetGame();
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
    );
  }
}

class _ScoreSummary extends StatelessWidget {
  const _ScoreSummary({
    required this.symbol,
    required this.score,
    required this.color,
  });

  final String symbol;
  final int score;
  final Color color;

  @override
  Widget build(BuildContext context) {
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

extension on BuildContext {
  Animation<double> fadeAnimation({
    required AnimationController controller,
  }) {
    return CurvedAnimation(
      parent: controller,
      curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
    );
  }

  Animation<double> scaleAnimation({
    required AnimationController controller,
  }) {
    return Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.elasticOut,
      ),
    );
  }
}
