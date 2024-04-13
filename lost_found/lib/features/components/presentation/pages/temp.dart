import 'package:flutter/material.dart';
import 'package:lost_found/features/components/presentation/pages/report_motivation_page.dart';

class HomePage extends StatelessWidget {
  static route() => MaterialPageRoute(builder: (context) => const HomePage());
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ReportMotivationPage(
        motivationText1: "Your lost item is reported!",
        motivationText2: "You are a step closer to get it back.",
        imageUrl: "lib/core/assets/images/lost_0.png",
      ),
    );
  }
}
