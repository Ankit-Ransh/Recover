import 'package:flutter/material.dart';
import 'package:lost_found/features/components/presentation/pages/report_found_item.dart';
import 'package:lost_found/features/components/presentation/pages/report_lost_item.dart';
import 'package:lost_found/features/components/presentation/pages/report_user_flow.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ReportUserFlow(),
    );
  }
}
