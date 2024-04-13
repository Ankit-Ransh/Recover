import 'package:flutter/material.dart';
import 'package:lost_found/features/components/presentation/pages/browse_item.dart';
import 'package:lost_found/features/components/presentation/pages/home_page.dart';
import 'package:lost_found/features/components/presentation/widgets/bottom_navigation_bar.dart';

class IndexPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const IndexPage());
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int selectedIndex = 0;

  List screenList = [
    const HomePage(),
    const BrowseItem(),
    const BrowseItem(),
    const BrowseItem(),
  ];

  void onTabChange(int value) {
    setState(() {
      selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList[selectedIndex],
      bottomNavigationBar: CustomBottomNavBar(
        onTabChange: onTabChange,
      ),
    );
  }
}
