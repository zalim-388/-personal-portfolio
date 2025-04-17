import 'package:flutter/material.dart';
import 'package:personalportfolio/screens/PortfolioPage%20.dart';
import 'package:personalportfolio/widgtes/responsive.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Responsive(
        mobile: PortfolioPage(),
        mobileLarge: PortfolioPage(),
        tablet: PortfolioPage(),
        desktop: PortfolioPage(),
      ),
    );
  }
}
