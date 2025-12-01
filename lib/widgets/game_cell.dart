import 'package:flutter/material.dart';
import 'package:tictactoe/models/player.dart';
import 'package:tictactoe/services/sound_service.dart';
import 'package:tictactoe/utils/game_colors.dart';

class GameCell extends StatefulWidget {
  final int index;
  final PlayerType? value;
  final bool isGameOver;
  final VoidCallback onTap;

  const GameCell({
    super.key,
    required this.index,
    required this.value,
    required this.isGameOver,
    required this.onTap,
  });

  @override
  State<GameCell> createState() => _GameCellState();
}

class _GameCellState extends State<GameCell>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.elasticOut,
      ),
    );
  }

  @override
  void didUpdateWidget(GameCell oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != null && oldWidget.value == null) {
      _animationController.forward(from: 0);
    } else if (widget.value == null && oldWidget.value != null) {
      _animationController.reset();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isX = widget.value == PlayerType.x;
    final isEmpty = widget.value == null;

    return GestureDetector(
      onTapDown: isEmpty && !widget.isGameOver
          ? (_) {
              setState(() => _isPressed = true);
              SoundService().playTapDown();
            }
          : null,
      onTapUp: isEmpty && !widget.isGameOver
          ? (_) {
              setState(() => _isPressed = false);
              SoundService().playTapUp();
              widget.onTap();
            }
          : null,
      onTapCancel: isEmpty && !widget.isGameOver
          ? () {
              setState(() => _isPressed = false);
            }
          : null,
      child: AnimatedScale(
        scale: _isPressed ? 0.95 : 1.0,
        duration: const Duration(milliseconds: 150),
        child: Container(
          decoration: BoxDecoration(
            gradient: GameColors.cellGradient,
            borderRadius: BorderRadius.circular(16),
            border: .all(
              color: Colors.white.withAlpha(25),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(50),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: widget.value != null
                ? ScaleTransition(
                    scale: _scaleAnimation,
                    child: Text(
                      isX ? 'X' : 'O',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: .bold,
                        color: isX
                            ? const Color(0xFFE63946)
                            : const Color(0xFF4ECDC4),
                        shadows: [
                          Shadow(
                            color:
                                (isX
                                        ? const Color(0xFFE63946)
                                        : const Color(0xFF4ECDC4))
                                    .withAlpha(130),
                            blurRadius: 12,
                          ),
                        ],
                      ),
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
