import 'package:flutter/material.dart';
import 'package:lost_found/core/theme/app_pallete.dart';
import 'package:lost_found/features/components/presentation/widgets/bottom_navigation_bar.dart';
import 'package:lost_found/features/components/presentation/widgets/information_about_app.dart';
import 'package:lost_found/features/components/presentation/widgets/report_item_container.dart';
import 'package:lost_found/features/components/presentation/widgets/welcome_bar.dart';

class HomePage extends StatelessWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (context) => const HomePage());
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
