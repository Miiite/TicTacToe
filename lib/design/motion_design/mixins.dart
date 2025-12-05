import 'package:flutter/widgets.dart';

/// Exposes a basic animation object that should be used to scale a widget
mixin ScaleMotionMixin {
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

/// Exposes a basic animation object that should be used to fade a widget
mixin FadeMotionMixin {
  Animation<double> fadeAnimation({
    required AnimationController controller,
  }) {
    return CurvedAnimation(
      parent: controller,
      curve: Curves.easeIn,
    );
  }
}
