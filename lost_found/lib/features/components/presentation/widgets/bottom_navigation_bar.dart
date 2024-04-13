import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lost_found/core/theme/app_pallete.dart';
import 'package:lost_found/features/components/presentation/pages/browse_item.dart';
import 'package:lost_found/features/components/presentation/pages/home_page.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GNav(
      gap: 8.0,
      activeColor: AppPallete.deepPurple,
      tabBackgroundColor: AppPallete.lightGrey,
      padding: const EdgeInsets.all(30),
      tabs: [
        GButton(
          icon: Icons.home,
          text: "Home",
          onPressed: () {
            Navigator.push(context, HomePage.route());
          },
        ),
        GButton(
          icon: Icons.search,
          text: "Browse",
          onPressed: () {
            Navigator.push(context, BrowseItem.route());
          },
        ),
        GButton(
          icon: Icons.chat_bubble_outline_outlined,
          text: "Chat",
          onPressed: () {
            // Navigator.push(context, BrowseItem.route());
          },
        ),
        GButton(
          icon: Icons.person_2_outlined,
          text: "Profile",
          onPressed: () {
            // Navigator.push(context, BrowseItem.route());
          },
        ),
      ],
    );
  }
}
