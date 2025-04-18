import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:personalportfolio/screens/Aboutme.dart';
import 'package:personalportfolio/screens/contactscreen.dart';
import 'package:personalportfolio/screens/projectscreen.dart';
import 'package:personalportfolio/utils/Appcolor.dart';
import 'package:personalportfolio/utils/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final scrollController = ScrollController();

  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final projectKey = GlobalKey();
  final contactKey = GlobalKey();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  Future<void> _launcherUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await launchUrl(uri, mode: LaunchMode.externalApplication)) ;
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.ismobile(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,

            colors: [  BackgroundColor , PrimaryColor ,BackgroundColor, ],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 100,
                vertical: isMobile ? 40 : 100,
              ),
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
                    Container(
                      key: homeKey,
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height,

                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isMobile ? 20 : 100,
                          vertical: isMobile ? 40 : 100,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 250, top: 120),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Hi, I'm Salim 👋",
                                    style: TextStyle(
                                      fontSize: 28,
                                      color: Colors.white,
                                    ),
                                  ),

                                  SizedBox(height: 10),
                                  Text(
                                    "Flutter Developer",

                                    style: TextStyle(
                                      fontFamily: "sora",

                                      foreground:
                                          Paint()
                                            ..shader = LinearGradient(
                                              colors: [
                                                accentTextColor,
                                                statTitleColor,
                                              ],
                                            ).createShader(
                                              Rect.fromLTWH(
                                                0.0,
                                                0.0,
                                                300.0,
                                                70.0,
                                              ),
                                            ),
                                      fontSize: 50,
                                      letterSpacing: -1,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  SizedBox(height: 10),
                                  Text(
                                    "Flutter developer passionate about building sleek, responsive,\n and user-friendly mobile apps. Let’s bring your ideas to life!",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: "Inter",
                                      height: 1.5,
                                      color: Color(0xFFCFCFCF),
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                              ElevatedButton.icon(
                                onPressed: () async {},
                                label: Text("Download CV"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(color: accentTextColor),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed:
                                    () => _launcherUrl(
                                      "https://github.com/zalim-388",
                                    ),
                                icon: Icon(FontAwesomeIcons.github),
                              ),
                              IconButton(
                                onPressed:
                                    () => _launcherUrl(
                                      "https://www.linkedin.com/in/salim-a31335351/",
                                    ),
                                icon: Icon(FontAwesomeIcons.linkedin),
                              ),
                              IconButton(
                                onPressed:
                                    () => _launcherUrl(
                                      "https://www.instagram.com/zaliiim__?igsh=emg5NTZ3Z3pjNGkz",
                                    ),
                                icon: Icon(FontAwesomeIcons.instagram),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // child: Stack(
                      //   children: [
                      //     Positioned(
                      //       top: 30,
                      //       left: 0,
                      //       right: 0,
                      //       bottom: 10,
                      //       child: Center(
                      //         child: Text(
                      //           "Flutter developer",
                      //           style: TextStyle(
                      //             fontSize: isMobile ? 100 : 200,
                      //             fontWeight: FontWeight.bold,
                      //             color: Colors.white.withOpacity(0.01),
                      //             letterSpacing: -10,
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                    ),
                    Container(key: aboutKey, child: const Aboutme()),
                    Container(key: projectKey, child: const ProjectScreen()),
                    Container(key: contactKey, child: const ContactScreen()),
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
