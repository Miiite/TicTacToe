import 'package:flutter/material.dart';

import '../models/models.dart';
import '../services/sound_service.dart';

class GameCell extends StatefulWidget {
  final int index;
  final PlayerType? value;
  final bool isWinningCell;
  final bool isGameOver;
  final VoidCallback onTap;

  const GameCell({
    super.key,
    required this.index,
    required this.value,
    required this.isWinningCell,
    required this.isGameOver,
    required this.onTap,
  });

  @override
  State<GameCell> createState() => _GameCellState();
}

class _GameCellState extends State<GameCell> with SingleTickerProviderStateMixin {
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
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: widget.isWinningCell
                  ? [
                      const Color(0xFF4ECDC4).withAlpha(80),
                      const Color(0xFF44CF6C).withAlpha(80),
                    ]
                  : [
                      const Color(0xFF1B263B),
                      const Color(0xFF2D3E50),
                    ],
            ),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: widget.isWinningCell
                  ? const Color(0xFF4ECDC4)
                  : Colors.white.withAlpha(25),
              width: widget.isWinningCell ? 2 : 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(50),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
              if (widget.isWinningCell)
                BoxShadow(
                  color: const Color(0xFF4ECDC4).withAlpha(75),
                  blurRadius: 16,
                  spreadRadius: 2,
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
                        fontWeight: FontWeight.bold,
                        color: isX
                            ? const Color(0xFFE63946)
                            : const Color(0xFF4ECDC4),
                        shadows: [
                          Shadow(
                            color: (isX
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
