import 'package:flutter/material.dart';

class ItemTitle extends StatelessWidget {
  const ItemTitle({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        decoration: const InputDecoration(
          border: InputBorder.none,
          labelText: "Title",
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
        ),
        validator: (value) {},
        onSaved: (value) {},
      ),
    );
  }
}
