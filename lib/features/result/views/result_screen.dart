import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_confetti/flutter_confetti.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:tictactoe/design_system/design_system.dart';
import 'package:tictactoe/features/game/blocs/game_cubit.dart';
import 'package:tictactoe/features/result/blocs/result_cubit.dart';
import 'package:tictactoe/widgets/animated_score_summary.dart';
import 'package:tictactoe/widgets/cubit_loader.dart';

const _animationDuration = Duration(milliseconds: 800);

class ResultScreen extends HookWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResultCubit(),
      child: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return CubitLoader<ResultCubit, ResultState>(
      child: Scaffold(
        body: _ConfettiCanon(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: AppTheme.of(context).backgroundGradient,
            ),
            child: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: .center,
                  spacing: 60,
                  children: [
                    _GameResultMessage(),
                    AnimatedScoreSummary(
                      duration: _animationDuration,
                      backgroundColor: Colors.white.withAlpha(13),
                    ),
                    _ActionButtons(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ConfettiCanon extends HookWidget {
  const _ConfettiCanon({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final isDraw = context.select((ResultCubit cubit) {
      return cubit.state.mapOrNull(
        success: (value) => value.winner == null,
      );
    });
    final confettiOptions = useMemoized(() {
      return ConfettiOptions(
        particleCount: 100,
        spread: 70,
        startVelocity: 30,
        y: 0.5,
      );
    }, []);

    useEffect(() {
      if (isDraw == null) return null;

      late final ConfettiController leftCanonController;
      late final ConfettiController rightCanonController;

      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        leftCanonController = Confetti.launch(
          context,
          options: confettiOptions.copyWith(
            particleCount: isDraw ? 1 : 100,
            x: 0,
            angle: 60,
          ),
        );
        rightCanonController = Confetti.launch(
          context,
          options: confettiOptions.copyWith(
            particleCount: isDraw ? 1 : 100,
            x: 1,
            angle: 120,
          ),
        );
      });

      return () {
        leftCanonController.kill();
        rightCanonController.kill();
      };
    }, [isDraw]);

    return child;
  }
}

class _GameResultMessage extends HookWidget
    with FadeMotionMixin, ScaleMotionMixin {
  const _GameResultMessage();

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final (isXWinner, isOWinner, isDraw) = context.select((ResultCubit cubit) {
      return (false, false, true);
    });

    final winnerColor = isXWinner
        ? theme.red
        : isOWinner
        ? theme.green
        : Colors.white70;

    final controller = useAnimationController(
      duration: _animationDuration,
    );
    final fade = useMemoized(() {
      return fadeAnimation(controller: controller);
    }, [controller]);
    final scale = useMemoized(() {
      return scaleAnimation(controller: controller);
    }, [controller]);

    useEffect(
      () {
        controller.forward();
        return null;
      },
      // Launch the animation only once
      [controller],
    );
    return FadeTransition(
      opacity: fade,
      child: ScaleTransition(
        scale: scale,
        child: Column(
          children: [
            _Icon(winnerColor: winnerColor, isDraw: isDraw),
            const SizedBox(height: 32),
            _Text(isDraw: isDraw),
            const SizedBox(height: 16),
            if (!isDraw)
              _WinnerIcon(
                winnerColor: winnerColor,
                isXWinner: isXWinner,
              ),
          ],
        ),
      ),
    );
  }
}

class _WinnerIcon extends StatelessWidget {
  const _WinnerIcon({
    required this.winnerColor,
    required this.isXWinner,
  });

  final Color winnerColor;
  final bool isXWinner;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            winnerColor.withAlpha(75),
            winnerColor.withAlpha(50),
          ],
        ),
        borderRadius: .circular(20),
        border: .all(
          color: winnerColor.withAlpha(130),
          width: 2,
        ),
      ),
      child: Padding(
        padding: const .symmetric(
          horizontal: 40,
          vertical: 20,
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
    );
  }
}

class _Text extends StatelessWidget {
  const _Text({
    required this.isDraw,
  });

  final bool isDraw;

  @override
  Widget build(BuildContext context) {
    return Text(
      isDraw ? "IT'S A DRAW!" : 'WINNER!',
      style: TextStyle(
        fontSize: 16,
        fontWeight: .w500,
        color: Colors.white.withAlpha(180),
        letterSpacing: 4,
      ),
    );
  }
}

class _Icon extends StatelessWidget {
  const _Icon({
    required this.winnerColor,
    required this.isDraw,
  });

  final Color winnerColor;
  final bool isDraw;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 120,
      child: DecoratedBox(
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
    );
  }
}

class _ActionButtons extends HookWidget with FadeMotionMixin {
  const _ActionButtons();

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: _animationDuration,
    );
    final fade = useMemoized(() {
      return fadeAnimation(controller: controller);
    }, [controller]);

    useEffect(
      () {
        controller.forward();
        return null;
      },
      [],
    );

    return FadeTransition(
      opacity: fade,
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
              GoRouter.of(context).go('/');
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
