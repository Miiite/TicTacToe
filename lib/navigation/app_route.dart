import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

typedef AppRouterViewBuilder = Widget Function(BuildContext context, GoRouterState state);

abstract class AppRoute extends GoRoute {
  AppRoute({
    required super.path,
    required AppRouterViewBuilder viewBuilder,
  }) : super(
         pageBuilder: (context, state) {
           return CustomTransitionPage<void>(
             key: state.pageKey,
             child: viewBuilder(context, state),
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
