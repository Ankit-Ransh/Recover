import 'package:flutter/material.dart';

class ItemImageUpload extends StatelessWidget {
  final String description;
  const ItemImageUpload({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.upload_file,
            size: 35,
            color: Color.fromARGB(255, 133, 37, 228),
          ),
          Text(
            description,
            style: const TextStyle(
              color: Color.fromARGB(255, 133, 37, 228),
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }
}
