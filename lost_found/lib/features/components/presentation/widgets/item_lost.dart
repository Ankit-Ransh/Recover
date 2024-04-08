import 'package:flutter/material.dart';
import 'package:lost_found/features/components/presentation/pages/report_lost_item.dart';
import 'package:lost_found/features/components/presentation/widgets/item_status.dart';

class ItemLost extends StatelessWidget {
  const ItemLost({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ReportLostItem(),
          ),
        );
      },
      child: const ItemStatus(
        iconData: Icons.sentiment_dissatisfied_rounded,
        status: "Item you lost",
      ),
    );
  }
}
