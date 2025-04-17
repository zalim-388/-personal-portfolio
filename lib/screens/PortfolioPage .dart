import 'package:flutter/material.dart';
import 'package:personalportfolio/screens/Aboutme.dart';
import 'package:personalportfolio/screens/contactscreen.dart';
import 'package:personalportfolio/screens/homepage.dart';
import 'package:personalportfolio/screens/projectscreen.dart';
import 'package:personalportfolio/widgtes/Appcolor.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final scrollController = ScrollController();

  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final projectKey = GlobalKey();
  final contactKey = GlobalKey();

  void scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: Appcolor.backgroundGradient),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _buildNavButton("Home", homeKey),
                  _buildNavButton("About", aboutKey),
                  _buildNavButton("Projects", projectKey),
                  _buildNavButton("Contact", contactKey),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                controller: scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(key: homeKey, child: const Homepage()),
                    SizedBox(key: aboutKey, child: const Aboutme()),
                    SizedBox(key: projectKey, child: ProjectScreen()),
                    SizedBox(key: contactKey, child: const ContactScreen()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavButton(String title, GlobalKey key) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextButton(
        onPressed: () => scrollToSection(key),
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
