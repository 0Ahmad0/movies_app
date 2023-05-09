import 'package:flutter/material.dart';
import '/core/services/services_locator.dart';
import '/core/utils/app_string.dart';
import '/movies/presentation/screens/movies_screen.dart';
import 'movies/presentation/screens/splash_screen.dart';

void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.appName,
      theme: ThemeData.dark(),
      home: const SplashScreen(),
    );
  }
}
