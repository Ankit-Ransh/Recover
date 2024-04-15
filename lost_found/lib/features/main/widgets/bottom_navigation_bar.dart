import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lost_found/core/theme/app_pallete.dart';

class CustomBottomNavBar extends StatelessWidget {
  final void Function(int) onTabChange;
  const CustomBottomNavBar({
    super.key,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return GNav(
      gap: 8.0,
      activeColor: AppPallete.deepPurple,
      tabBackgroundColor: AppPallete.lightGrey,
      padding: const EdgeInsets.all(30),
      onTabChange: onTabChange,
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
    );
  }
}
