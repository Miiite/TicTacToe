import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoute extends GoRoute {
  AppRoute({
    required super.path,
    required Widget child,
  }) : super(
         pageBuilder: (context, state) {
           return CustomTransitionPage<void>(
             key: state.pageKey,
             child: child,
             transitionDuration: const Duration(milliseconds: 300),
             reverseTransitionDuration: const Duration(milliseconds: 300),
             transitionsBuilder:
                 (context, animation, secondaryAnimation, child) {
                   return FadeTransition(
                     opacity: CurveTween(
                       curve: Curves.easeInOut,
                     ).animate(animation),
                     child: child,
                   );
                 },
           );
         },
       );
}
