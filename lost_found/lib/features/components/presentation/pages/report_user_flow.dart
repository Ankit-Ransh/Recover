import 'package:flutter/material.dart';
import 'package:lost_found/core/theme/app_pallete.dart';
import 'package:lost_found/features/components/presentation/pages/home_page.dart';
import 'package:lost_found/features/components/presentation/widgets/item_found.dart';
import 'package:lost_found/features/components/presentation/widgets/item_lost.dart';

class ReportUserFlow extends StatelessWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const ReportUserFlow());
  const ReportUserFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.push(
              context,
              HomePage.route(),
            );
          },
        ),
        backgroundColor: AppPallete.whiteColor,
      ),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50.0,
            ),
            Text(
              'What do you want to report?',
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: AppPallete.blackColor,
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ItemLost(),
                ItemFound(),
              ],
            ),
            Expanded(child: SizedBox.shrink()), // To take up remaining space
          ],
        ),
      ),
    );
  }
}
