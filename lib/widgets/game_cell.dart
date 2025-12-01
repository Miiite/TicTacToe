import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tictactoe/models/player.dart';
import 'package:tictactoe/utils/game_colors.dart';

class GameCell extends HookWidget {
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
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      keys: [ValueKey(value)],
      duration: const Duration(milliseconds: 200),
    );
    final scaleAnimation = useAnimation(
      Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: animationController,
          curve: Curves.elasticOut,
        ),
      ),
    );

    final isX = value == PlayerType.x;

    useEffect(() {
      animationController.forward();
      return null;
    });

    return _Pressable(
      onTap: onTap,

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
          child: value != null
              ? ScaleTransition(
                  scale: AlwaysStoppedAnimation(scaleAnimation),
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
    );
  }
}

class _Pressable extends StatefulWidget {
  const _Pressable({
    required this.onTap,
    required this.child,
  });

  final VoidCallback onTap;
  final Widget child;

  @override
  State<_Pressable> createState() => __PressableState();
}

class __PressableState extends State<_Pressable> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (details) {
        setState(() {
          _isPressed = false;
        });
        widget.onTap.call();
      },
      child: AnimatedScale(
        scale: _isPressed ? 0.95 : 1.0,
        duration: const Duration(milliseconds: 150),
        child: widget.child,
      ),
    );
  }
}
