import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/Home/presentation/screens/portfolio_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const PortfolioPage(),
    );
  }
}
