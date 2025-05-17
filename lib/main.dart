import 'package:flutter/material.dart';
import 'screens/home/features/home_screen.dart';
import 'screens/onboarding/onboarding_screen.dart';
import 'themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const OnboardingScreen(),
      routes: {'/home': (context) => HomeScreen()},
    );
  }
}
