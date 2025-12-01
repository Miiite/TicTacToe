import 'package:flutter/services.dart';

/// A lightweight sound service that provides subtle haptic and audio feedback.
/// Uses system haptic feedback for a non-intrusive experience.
class SoundService {
  static final SoundService _instance = SoundService._internal();
  factory SoundService() => _instance;
  SoundService._internal();

  bool _initialized = false;

  Future<void> initialize() async {
    if (_initialized) return;
    _initialized = true;
  }

  /// Plays a subtle tap-down feedback using light haptics
  Future<void> playTapDown() async {
    // Light haptic impact for a discreet, non-intrusive feel
    await HapticFeedback.lightImpact();
  }

  /// Plays a subtle tap-up feedback using selection click
  Future<void> playTapUp() async {
    // Selection click for the release - very subtle
    await HapticFeedback.selectionClick();
  }

  void dispose() {
    // Nothing to dispose in this simplified version
  }
}
