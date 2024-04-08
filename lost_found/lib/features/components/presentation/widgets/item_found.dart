import 'package:flutter/material.dart';
import 'package:lost_found/features/components/presentation/pages/report_found_item.dart';
import 'package:lost_found/features/components/presentation/widgets/item_status.dart';

class ItemFound extends StatelessWidget {
  const ItemFound({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ReportFoundItem(),
          ),
        );
      },
      child: const ItemStatus(
        iconData: Icons.sentiment_satisfied_alt_rounded,
        status: "Item you found",
      ),
    );
  }
}
