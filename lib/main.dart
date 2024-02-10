import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:userapp/constants/app_colors.dart';
import 'package:userapp/page/splash/splash_screen.dart';

import 'flutter_flow/flutter_flow_theme.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp>  {

  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  void setThemeMode(ThemeMode mode) => setState(() {
    _themeMode = mode;
    FlutterFlowTheme.saveThemeMode(mode);
  });


  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      overlayColor: Colors.grey.withOpacity(0.5),
      useDefaultLoading: false,
      overlayWidgetBuilder: (_) { //ignored progress for the moment
        return Center(
          child: SpinKitThreeBounce(
            color: AppColors.loginDividerColor,
            size: 50.0,
          ),
        );
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData(brightness: Brightness.light),
        themeMode: ThemeMode.light,
        title: 'RVT1',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.loginDividerColor),
          useMaterial3: true,
        ),
        home: SplashScreen(),
      ),
    );
  }

}