import 'package:flutter/material.dart';

class AppThemeData {
  static const AppThemeData regular = AppThemeData(
    red: Color(0xFFE63946),
    green: Color(0xFF4ECDC4),
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
    required this.red,
    required this.green,
    required this.backgroundGradient,
    required this.redGradient,
    required this.greenGradient,
    required this.cellGradient,
  });

  final Color red;
  final Color green;
  final LinearGradient backgroundGradient;
  final LinearGradient redGradient;
  final LinearGradient greenGradient;
  final LinearGradient cellGradient;

  AppThemeData copyWith({
    Color? red,
    Color? green,
    LinearGradient? backgroundGradient,
    LinearGradient? redGradient,
    LinearGradient? greenGradient,
    LinearGradient? cellGradient,
  }) {
    return AppThemeData(
      red: red ?? this.red,
      green: green ?? this.green,
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
