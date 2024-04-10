import 'package:flutter/material.dart';
import 'package:lost_found/features/components/presentation/pages/report_user_flow.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ReportUserFlow(),
            ),
          );
        },
        child: const Icon(Icons.upload),
      ),
    );
  }
}
