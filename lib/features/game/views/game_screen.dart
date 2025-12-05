import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tictactoe/design_system/theme.dart';
import 'package:tictactoe/features/game/blocs/game_cubit.dart';
import 'package:tictactoe/features/game/models/player.dart';
import 'package:tictactoe/widgets/animated_score_summary.dart';
import 'package:tictactoe/widgets/game_cell.dart';

const _animationDuration = Duration(milliseconds: 300);

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final backgroundGradient = context.select((GameCubit cubit) {
      return cubit.state.maybeMap(
        game: (value) {
          return switch (value.playing.type) {
            ActionType.x => theme.redGradient,
            ActionType.o => theme.greenGradient,
          };
        },
        orElse: () => theme.backgroundGradient,
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
                  showActivePlayerIndicator: true,
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

class _GameBoard extends HookWidget {
  const _GameBoard();

  static const _itemSpacing = 12.0;
  static const _numberOfRows = 3;

  @override
  Widget build(BuildContext context) {
    final gameBoard = context.select((GameCubit cubit) {
      return cubit.state.mapOrNull(
        game: (game) => game.board,
        result: (result) => result.board,
      );
    });
    final showCells = useState(false);
    useEffect(() {
      Future.delayed(
        Duration(milliseconds: 6 * _animationDuration.inMilliseconds),
        () {
          showCells.value = true;
        },
      );
      return null;
    }, [true]);

    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const .all(_itemSpacing),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final cellWidth = constraints.maxWidth / _numberOfRows;

            return Stack(
              children: [
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: _numberOfRows,
                  ),
                  itemCount: _numberOfRows * _numberOfRows,
                  itemBuilder: (context, index) {
                    return AnimatedOpacity(
                      opacity: showCells.value ? 1.0 : 0.0,
                      duration: _animationDuration,
                      curve: Curves.easeInOut,
                      child: Padding(
                        padding: const .all(_itemSpacing / 2),
                        child: GameCell(
                          index: index,
                          playerType: gameBoard?[index],
                          onTap: showCells.value
                              ? () {
                                  context.read<GameCubit>().selectCell(index);
                                }
                              : () {},
                        ),
                      ),
                    );
                  },
                ),
                for (int i = 1; i <= _numberOfRows - 1; i++) ...[
                  // Vertical separator
                  Positioned(
                    left: (cellWidth * i) - (_itemSpacing / 8),
                    top: 0,
                    bottom: 0,
                    child: _AnimatedGridSeparator(
                      delay: Duration(
                        milliseconds: _animationDuration.inMilliseconds * i,
                      ),
                      axis: Axis.vertical,
                    ),
                  ),
                  // Horizontal separator
                  Positioned(
                    top: (cellWidth * i) - (_itemSpacing / 8),
                    left: 0,
                    right: 0,
                    child: _AnimatedGridSeparator(
                      delay: Duration(
                        milliseconds:
                            _animationDuration.inMilliseconds * (i + 2),
                      ),
                      axis: Axis.horizontal,
                    ),
                  ),
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}

class _AnimatedGridSeparator extends HookWidget {
  const _AnimatedGridSeparator({
    required this.delay,
    required this.axis,
  });

  final Duration delay;
  final Axis axis;

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: _animationDuration,
    );
    final animation = useAnimation(
      Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: animationController,
          curve: Curves.easeInOut,
        ),
      ),
    );

    useEffect(() {
      Future.delayed(delay, () {
        animationController.forward();
      });
      return null;
    }, [animationController]);

    return SizedBox(
      width: 4,
      child: RotatedBox(
        quarterTurns: axis == Axis.vertical ? 1 : 0,
        child: LinearProgressIndicator(
          value: animation,
          backgroundColor: Colors.transparent,
          valueColor: AlwaysStoppedAnimation<Color>(
            Color(0xFF0C0908).withAlpha(180),
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
