import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/screens.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'newGame',
        pageBuilder: (context, state) => _buildFadeTransitionPage(
          key: state.pageKey,
          child: const NewGameScreen(),
        ),
      ),
      GoRoute(
        path: '/game',
        name: 'game',
        pageBuilder: (context, state) => _buildFadeTransitionPage(
          key: state.pageKey,
          child: const GameScreen(),
        ),
      ),
      GoRoute(
        path: '/result',
        name: 'result',
        pageBuilder: (context, state) => _buildFadeTransitionPage(
          key: state.pageKey,
          child: const ResultScreen(),
        ),
      ),
    ],
  );

  static CustomTransitionPage<void> _buildFadeTransitionPage({
    required LocalKey key,
    required Widget child,
  }) {
    return CustomTransitionPage<void>(
      key: key,
      child: child,
      transitionDuration: const Duration(milliseconds: 300),
      reverseTransitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
          child: child,
        );
      },
    );
  }
}
