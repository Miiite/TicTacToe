import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/design_system/design_system.dart';
import 'package:tictactoe/features/game/models/game_score.dart';
import 'package:tictactoe/features/game/models/player.dart';

class AnimatedScoreSummary extends HookWidget with FadeMotionMixin {
  const AnimatedScoreSummary({
    super.key,
    required this.duration,
    required this.gameScore,
    this.backgroundColor,
  });

  final Duration duration;
  final GameScore gameScore;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: duration,
    );
    final fade = useMemoized(() {
      return fadeAnimation(controller: controller);
    }, [controller]);

    useEffect(
      () {
        controller.forward();
        return null;
      },
      // Make sure this callback is called only once
      [controller],
    );

    return Provider.value(
      value: gameScore,
      child: FadeTransition(
        opacity: fade,
        child: Container(
          padding: const .all(24),
          margin: const .symmetric(horizontal: 48),
          decoration: BoxDecoration(
            color: backgroundColor ?? Colors.white,
            borderRadius: .circular(20),
            border: .all(
              color: (backgroundColor ?? Colors.white).withAlpha(25),
            ),
          ),
          child: Row(
            mainAxisAlignment: .spaceEvenly,
            children: [
              _XPlayerScore(),
              SizedBox(
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
      ),
    );
  }
}

class _XPlayerScore extends StatelessWidget {
  const _XPlayerScore();

  @override
  Widget build(BuildContext context) {
    final score = context.select((GameScore gameScore) {
      return gameScore.playerXScore;
    });

    return _ScoreSummary(
      symbol: ActionType.x.symbol,
      score: score,
      color: AppTheme.of(context).primaryPlayerColor,
    );
  }
}

class _OPlayerScore extends StatelessWidget {
  const _OPlayerScore();

  @override
  Widget build(BuildContext context) {
    final score = context.select((GameScore gameScore) {
      return gameScore.playerOScore;
    });

    return _ScoreSummary(
      symbol: ActionType.o.symbol,
      score: score,
      color: AppTheme.of(context).secondaryPlayerColor,
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
      spacing: 4,
      children: [
        Text(
          symbol,
          style: TextStyle(
            fontSize: 24,
            fontWeight: .bold,
            color: color,
          ),
        ),
        Text(
          score.toString(),
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
