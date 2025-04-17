import 'package:flutter/material.dart';
import 'package:personalportfolio/screens/PortfolioPage%20.dart';

class Responsive extends StatelessWidget {
  final Widget? mobile;
  final Widget? mobilelarge;
  final Widget? tablet;
  final Widget? desktop;

  const Responsive({
    super.key,
    this.mobile,
    this.mobilelarge,
    this.tablet,
    this.desktop,
    required PortfolioPage mobileLarge,
  });
  static bool ismobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool ismobilelarge(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width < 800;

  static bool istablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 800 &&
      MediaQuery.of(context).size.width < 1024;

  static bool isdesktop(BuildContext context) =>
      MediaQuery.of(context).size.width <= 102;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    if (width >= 1024 && desktop != null) {
      return desktop!;
    } else if (width >= 800 && tablet != null) {
      return tablet!;
    } else if (width >= 700 && mobilelarge != null) {
      return mobilelarge!;
    } else {
      return mobile!;
    }
  }
}
