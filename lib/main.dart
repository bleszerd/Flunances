import 'package:flunances/shared/theme/app_colors.dart';
import 'package:flunances/views/landing_page/landing_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FlunancesApp());
}

class FlunancesApp extends StatelessWidget {
  const FlunancesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flunances',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.surface,
        fontFamily: 'Brasley',
      ),
      routes: {
        "/": (context) => const LandingPage(),
      },
    );
  }
}
