import 'package:flutter/material.dart';
import 'common/theme.dart';
import 'screens/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FoodFlow',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      home: SplashScreen(),
    );
  }
}
