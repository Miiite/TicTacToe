import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_confetti/flutter_confetti.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tictactoe/bloc/game_cubit.dart';
import 'package:tictactoe/extensions/build_context_extensions.dart';
import 'package:tictactoe/utils/game_colors.dart';
import 'package:tictactoe/widgets/animated_score_summary.dart';
import 'package:tictactoe/widgets/main_button.dart';

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
                      AnimatedScoreSummary(
                        duration: _animationDuration,
                        backgroundColor: Colors.white.withAlpha(13),
                      ),
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
          MainButton(
            onTap: () {
              context.read<GameCubit>().newGameRound();
            },
            icon: Icons.replay_rounded,
            title: 'PLAY AGAIN',
          ),
          const SizedBox(height: 16),
          TextButton.icon(
            onPressed: () {
              context.read<GameCubit>().newGame();
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
