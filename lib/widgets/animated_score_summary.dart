import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tictactoe/bloc/game_cubit.dart';
import 'package:tictactoe/extensions/build_context_extensions.dart';
import 'package:tictactoe/models/player.dart';
import 'package:tictactoe/utils/game_colors.dart';

class AnimatedScoreSummary extends HookWidget {
  const AnimatedScoreSummary({
    super.key,
    required this.duration,
    this.backgroundColor,
  });

  final Duration duration;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: duration,
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
          color: backgroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: .all(
            color: (backgroundColor ?? Colors.white).withAlpha(25),
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
      color: GameColors.red,
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
      color: GameColors.green,
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
