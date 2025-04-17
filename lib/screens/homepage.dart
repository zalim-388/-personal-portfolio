import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF2C003E), // Dark Purple
                Color(0xFF0A0A0A), // Jet Black
              ],
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 60),

                child: TabBar(
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [Color(0xFF2C003E), Color(0xFF0A0A0A)],
                    ),
                  ),
                  dividerColor: Colors.transparent,
                  tabs: [
                    Tab(child: Text("Home", style: TextStyle(fontSize: 18))),
                    Tab(
                      child: Text("About Me", style: TextStyle(fontSize: 18)),
                    ),
                    Tab(
                      child: Text("Projects", style: TextStyle(fontSize: 18)),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: TabBarView(
                  children: [
                    // Home Tab
                    Stack(
                      children: [
                        Center(
                          child: Text(
                            "Flutter developer",
                            style: TextStyle(
                              fontSize: 200,
                              fontWeight: FontWeight.bold,
                              color: Colors.white.withOpacity(0.02),
                              letterSpacing: -10,
                            ),
                          ),
                        ),

                        //     About Me Content

                        //     "Projects Content",
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
