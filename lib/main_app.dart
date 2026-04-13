import 'package:flutter/material.dart';
import 'package:flutter_new_progress_tracker/features/home/screens/home_screen.dart';
import 'package:flutter_new_progress_tracker/features/onBoarding/screens/on_boarding_screen.dart';
import 'package:flutter_new_progress_tracker/shared/theme/app_theme.dart';

class MainApp extends StatelessWidget {
  final bool hasName;
  final String name;

  const MainApp({super.key, required this.hasName, required this.name});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: hasName
            ? HomeScreen(
                name: name,
              )
            : OnBoardingScreen(),
        theme: AppTheme.darkTheme);
  }
}
