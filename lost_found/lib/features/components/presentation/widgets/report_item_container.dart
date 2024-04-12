import 'package:flutter/material.dart';
import 'package:lost_found/core/theme/app_pallete.dart';
import 'package:lost_found/features/components/presentation/pages/report_user_flow.dart';
import 'package:lost_found/features/components/presentation/widgets/post_report_button.dart';

class ReportItemContainer extends StatelessWidget {
  const ReportItemContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Container(
        height: 220,
        decoration: BoxDecoration(
          border: Border.all(color: AppPallete.greyColor),
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListView(
          padding: const EdgeInsets.fromLTRB(35, 20, 35, 0),
          children: [
            const Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Lost an item?",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Or found a lost item?",
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "You can report it here to find",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      "it or help someone",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 40),
                Icon(
                  Icons.waving_hand_outlined,
                  size: 40.0,
                )
              ],
            ),
            const SizedBox(height: 20),
            PostReportButton(
              height: 40,
              borderRadius: 10,
              fontSize: 17,
              command: "Report an item",
              onTap: () {
                Navigator.push(context, ReportUserFlow.route());
              },
            )
          ],
        ),
      ),
    );
  }
}
