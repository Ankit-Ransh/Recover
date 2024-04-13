import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lost_found/core/theme/app_pallete.dart';
import 'package:lost_found/features/components/presentation/widgets/information_about_app.dart';
import 'package:lost_found/features/components/presentation/widgets/report_item_container.dart';
import 'package:lost_found/features/components/presentation/widgets/welcome_bar.dart';

class HomePage extends StatelessWidget {
  static route() => MaterialPageRoute(builder: (context) => const HomePage());
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 80,
                color: AppPallete.deepPurple,
              ),
              const WelcomeBar(),
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 3),
                child: Column(
                  children: [
                    ReportItemContainer(),
                    InformationAboutApp(),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: GNav(
          gap: 8.0,
          activeColor: AppPallete.deepPurple,
          tabBackgroundColor: AppPallete.lightGrey,
          padding: const EdgeInsets.all(30),
          onTabChange: (index) {},
          tabs: const [
            GButton(
              icon: Icons.home,
              text: "Home",
            ),
            GButton(
              icon: Icons.search,
              text: "Browse",
            ),
            GButton(
              icon: Icons.chat_bubble_outline_outlined,
              text: "Chat",
            ),
            GButton(
              icon: Icons.person_2_outlined,
              text: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
