import 'package:flutter/material.dart';

class AppThemeData {
  static const AppThemeData regular = AppThemeData(
    primaryPlayerColor: Color(0xFFE63946),
    secondaryPlayerColor: Color(0xFF4ECDC4),
    scoreTileBackgroundColor: Color(0xFF2D3E50),
    backgroundGradient: LinearGradient(
      colors: [Color(0xFF0D1B2A), Color(0xFF1B263B), Color(0xFF415A77)],
    ),
    redGradient: LinearGradient(
      colors: [Color(0xFFE63946), Color(0xFFFF6B6B), Color(0xFFC1121F)],
    ),
    greenGradient: LinearGradient(
      colors: [Color(0xFF4ECDC4), Color(0xFF6EE7DE), Color(0xFF2A9D8F)],
    ),
    cellGradient: LinearGradient(
      colors: [Color(0xFF1B263B), Color(0xFF2D3E50)],
    ),
  );

  const AppThemeData({
    required this.primaryPlayerColor,
    required this.secondaryPlayerColor,
    required this.scoreTileBackgroundColor,
    required this.backgroundGradient,
    required this.redGradient,
    required this.greenGradient,
    required this.cellGradient,
  });

  final Color primaryPlayerColor;
  final Color secondaryPlayerColor;
  final Color scoreTileBackgroundColor;
  final LinearGradient backgroundGradient;
  final LinearGradient redGradient;
  final LinearGradient greenGradient;
  final LinearGradient cellGradient;

  AppThemeData copyWith({
    Color? red,
    Color? green,
    Color? darkGray,
    LinearGradient? backgroundGradient,
    LinearGradient? redGradient,
    LinearGradient? greenGradient,
    LinearGradient? cellGradient,
  }) {
    return AppThemeData(
      primaryPlayerColor: red ?? this.primaryPlayerColor,
      secondaryPlayerColor: green ?? this.secondaryPlayerColor,
      scoreTileBackgroundColor: darkGray ?? this.scoreTileBackgroundColor,
      backgroundGradient: backgroundGradient ?? this.backgroundGradient,
      redGradient: redGradient ?? this.redGradient,
      greenGradient: greenGradient ?? this.greenGradient,
      cellGradient: cellGradient ?? this.cellGradient,
    );
  }
}

class AppTheme extends InheritedWidget {
  final AppThemeData data;

  const AppTheme({
    super.key,
    required this.data,
    required super.child,
  });

  static AppThemeData of(
    BuildContext context, {
    bool listen = true,
  }) {
    final widget = listen
        ? context.dependOnInheritedWidgetOfExactType<AppTheme>()
        : context.getElementForInheritedWidgetOfExactType<AppTheme>()?.widget
              as AppTheme;
    assert(widget != null, 'No DstTheme found in context');
    return widget!.data;
  }

  @override
  bool updateShouldNotify(AppTheme oldWidget) => data != oldWidget.data;
}
