import 'package:flutter/services.dart';

class UserFeedbackService {
  static final UserFeedbackService _instance = UserFeedbackService._();
  factory UserFeedbackService() => _instance;
  UserFeedbackService._();

  bool _initialized = false;

  Future<void> initialize() async {
    if (_initialized) return;
    _initialized = true;
  }

  Future<void> tapDownFeedback() async {
    await HapticFeedback.lightImpact();
  }

  Future<void> tapUpFeedback() async {
    await HapticFeedback.selectionClick();
  }
}
