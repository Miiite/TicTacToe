import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tictactoe/design_system/theme.dart';
import 'package:tictactoe/navigation/app_router.dart';

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
      child: MaterialApp.router(
        title: 'Tic Tac Toe',
        debugShowCheckedModeBanner: true,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: defaultTheme.secondaryPlayerColor,
            brightness: Brightness.dark,
          ),
          useMaterial3: true,
          fontFamily: 'SF Pro Display',
        ),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
