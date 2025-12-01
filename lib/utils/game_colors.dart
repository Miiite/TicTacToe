import 'package:flutter/widgets.dart';

class GameColors {
  static const Color red = Color(0xFFE63946);
  static const Color green = Color(0xFF4ECDC4);

  static LinearGradient backgroundGradient = LinearGradient(
    begin: .topLeft,
    end: .bottomRight,
    colors: [
      Color(0xFF0D1B2A),
      Color(0xFF1B263B),
      Color(0xFF415A77),
    ],
  );
}