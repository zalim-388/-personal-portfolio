import 'package:flutter/material.dart';
import 'package:personalportfolio/utils/Appcolor.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
    decoration: BoxDecoration( gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,

          colors: [BackgroundColor,PrimaryColor, BackgroundColor],)),
      child: Center(
        child: Text(
          "Contact Section",
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