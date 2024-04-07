import 'package:flutter/material.dart';

class ItemDescription extends StatelessWidget {
  final String description;
  final double fontSize;
  const ItemDescription(
      {super.key, required this.description, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: description,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          labelStyle: TextStyle(fontSize: fontSize),
        ),
        validator: (value) {},
        onSaved: (value) {},
      ),
    );
  }
}
