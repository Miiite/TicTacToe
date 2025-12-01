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

  static LinearGradient redGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFE63946),
      Color(0xFFFF6B6B),
      Color(0xFFC1121F),
    ],
  );

  static LinearGradient greenGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF4ECDC4),
      Color(0xFF6EE7DE),
      Color(0xFF2A9D8F),
    ],
  );

  static LinearGradient cellGradient = LinearGradient(
              begin: .topLeft,
              end: .bottomRight,
              colors: [
                      const Color(0xFF1B263B),
                      const Color(0xFF2D3E50),
                    ],
            );
}