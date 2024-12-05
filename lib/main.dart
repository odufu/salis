import 'package:flutter/material.dart';
import 'package:salis/salis/auth/presentation/pages/splash_screen.dart';
import 'package:salis/salis/core/theme/salis_mode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Salis Homes',
      theme: salisMode,
      home: const SplashScreen(),
    );
  }
}
