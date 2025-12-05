import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tictactoe/design/design_system/theme.dart';
import 'package:tictactoe/features/game/models/player.dart';

class GameCell extends HookWidget {
  const GameCell({
    super.key,
    required this.index,
    required this.playerType,
    required this.onTap,
  });

  final int index;
  final ActionType? playerType;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final animationController = useAnimationController(
      keys: [playerType],
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

    useEffect(() {
      animationController.forward();
      return null;
    });

    final playerTypeColor = playerType?.getTypeColor(theme);

    return _Pressable(
      onTap: playerType == null ? onTap : null,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: AppTheme.of(context).cellGradient,
          borderRadius: BorderRadius.circular(16),
          border: .all(
            color: Colors.white.withAlpha(25),
            width: 1,
          ),
        ),
        child: Center(
          child: playerType != null
              ? ScaleTransition(
                  scale: AlwaysStoppedAnimation(scaleAnimation),
                  child: Text(
                    playerType?.symbol.toUpperCase() ?? '',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: .bold,
                      color: playerTypeColor,
                      shadows: [
                        Shadow(
                          color:
                              playerTypeColor?.withAlpha(130) ?? Colors.black,
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

  final VoidCallback? onTap;
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
        if (widget.onTap != null) {
          setState(() {
            _isPressed = true;
          });
        }
      },
      onTapUp: (details) {
        if (widget.onTap case final onTap?) {
          setState(() {
            _isPressed = false;
          });

          onTap.call();
        }
      },
      child: AnimatedScale(
        scale: _isPressed ? 0.95 : 1.0,
        duration: const Duration(milliseconds: 150),
        child: widget.child,
      ),
    );
  }
}

extension on ActionType {
  Color getTypeColor(AppThemeData theme) {
    return switch (this) {
      ActionType.x => theme.primaryPlayerColor,
      ActionType.o => theme.secondaryPlayerColor,
    };
  }
}
