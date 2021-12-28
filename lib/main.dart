import 'package:flutter/material.dart';
import 'package:netflix_clone_app/feature/presentation/screens/splash_screen.dart';
import 'package:netflix_clone_app/feature/presentation/widgets/themes/custome_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix Clone App',
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      home: const SplashScreen(),
    );
  }
}
