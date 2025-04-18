import 'package:flutter/material.dart';
import 'package:personalportfolio/utils/Appcolor.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,

          colors: [BackgroundColor,PrimaryColor, BackgroundColor],
        ),
      ),
      child: Center(
        child: Text(
          "Projects Section",
          style: TextStyle(
            fontSize: 32,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
