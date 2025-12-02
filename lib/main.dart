import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tictactoe/bloc/game_cubit.dart';
import 'package:tictactoe/navigation/app_router.dart';
import 'package:tictactoe/navigation/game_cubit_navigation_listener.dart';
import 'package:tictactoe/services/user_feedback_service.dart';
import 'package:tictactoe/utils/game_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  await UserFeedbackService().initialize();

  runApp(const TicTacToeApp());
}

class TicTacToeApp extends StatelessWidget {
  const TicTacToeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GameCubit(),
      child: MaterialApp.router(
        title: 'Tic Tac Toe',
        debugShowCheckedModeBanner: true,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: GameColors.green,
            brightness: Brightness.dark,
          ),
          useMaterial3: true,
          fontFamily: 'SF Pro Display',
        ),
        routerConfig: AppRouter.router,
        builder: (context, child) {
          return child != null
              ? GameCubitNavigationListener(
                  router: AppRouter.router,
                  child: child,
                )
              : const SizedBox.shrink();
        },
      ),
    );
  }
}
