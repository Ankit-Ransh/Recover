import 'package:flutter/material.dart';

class ItemPossibleCategory extends StatelessWidget {
  final String text;
  const ItemPossibleCategory({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 2, 6, 7),
      child: Container(
        height: 42.0,
        width: 100.0,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            text,
            textDirection: TextDirection.ltr,
            style: const TextStyle(
              fontSize: 14.0,
            ),
          ),
        ),
      ),
    );
  }
}
