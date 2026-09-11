import 'package:flutter/material.dart';

import 'theme/app_theme.dart';
import 'screens/portfolio_screen.dart';

void main() => runApp(const PortfolioApp());

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ahmer Ali | Python & Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const PortfolioScreen(),
    );
  }
}
