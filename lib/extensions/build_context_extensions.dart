import 'package:flutter/widgets.dart';

extension BuildContextExt on BuildContext {
  Animation<double> fadeAnimation({
    required AnimationController controller,
  }) {
    return CurvedAnimation(
      parent: controller,
      curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
    );
  }

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
