
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/nav_shell.dart';
import 'theme/app_theme.dart';
import 'theme/theme_notifier.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeNotifier = ThemeNotifier();
  await themeNotifier.loadFromPrefs();
  runApp(
    ChangeNotifierProvider.value(
      value: themeNotifier,
      child: const CheckAiApp(),
    ),
  );
}

class CheckAiApp extends StatelessWidget {
  const CheckAiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, notifier, _) {
        return MaterialApp(
          title: 'CheckAi',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light(),
          darkTheme: AppTheme.dark(),
          themeMode: notifier.themeMode,
          home: const NavShell(),
        );
      },
    );
  }
}
