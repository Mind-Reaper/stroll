import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stroll/core/screens/splash_screen.dart';
import 'package:stroll/shared/theme/dark_theme.dart';

class StrollApp extends StatelessWidget {
  const StrollApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black,
        statusBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
    return ProviderScope(
      child: MaterialApp(
        title: 'Stroll',
        debugShowCheckedModeBanner: false,
        darkTheme: darkTheme,
        themeMode: ThemeMode.dark,
        home: const SplashScreen(),
        builder: (context, child) {
          final data = MediaQuery.of(context);

          final scale =
              data.textScaler.clamp(minScaleFactor: 0.6, maxScaleFactor: 1.2);
          return MediaQuery(
              data: data.copyWith(textScaler: scale), child: child!);
        },
      ),
    );
  }
}
