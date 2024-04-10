import 'package:flutter/material.dart';
import 'package:lost_found/features/components/presentation/pages/report_user_flow.dart';

class HomePage extends StatelessWidget {
  static route() => MaterialPageRoute(builder: (context) => const HomePage());
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ReportUserFlow.route(),
            ),
          );
        },
        child: const Icon(Icons.upload),
      ),
    );
  }
}
