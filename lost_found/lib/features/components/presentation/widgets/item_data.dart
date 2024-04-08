import 'package:flutter/material.dart';
import 'package:lost_found/core/theme/app_pallete.dart';

class ItemData extends StatelessWidget {
  final String hintText;
  final double fontSize;
  final double height;
  final TextEditingController controller;
  const ItemData({
    super.key,
    required this.hintText,
    required this.controller,
    this.fontSize = 16,
    this.height = 50.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(color: AppPallete.greyColor),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: hintText,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          labelStyle: TextStyle(fontSize: fontSize),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "$hintText is missing!";
          }
          return null;
        },
        onChanged: (value) {
          controller.text = value;
        },
      ),
    );
  }
}
