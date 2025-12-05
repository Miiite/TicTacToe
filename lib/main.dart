import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tictactoe/design_system/theme.dart';
import 'package:tictactoe/features/game/blocs/game_cubit.dart';
import 'package:tictactoe/navigation/app_router.dart';
import 'package:tictactoe/navigation/game_cubit_navigation_listener.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const TicTacToeApp());
}

class TicTacToeApp extends StatelessWidget {
  const TicTacToeApp({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultTheme = AppThemeData.regular;

    return AppTheme(
      data: defaultTheme,
      child: BlocProvider(
        create: (context) => GameCubit(),
        child: MaterialApp.router(
          title: 'Tic Tac Toe',
          debugShowCheckedModeBanner: true,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: defaultTheme.green,
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
      ),
    );
  }
}
