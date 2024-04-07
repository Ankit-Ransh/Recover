import 'package:flutter/material.dart';

class ItemLost extends StatelessWidget {
  const ItemLost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        height: 180,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0),
          border: Border.all(
            color: Colors.transparent,
          ),
          color: Color.fromARGB(210, 239, 237, 237),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.sentiment_dissatisfied_rounded,
              size: 70.0,
              color: Color.fromARGB(174, 14, 36, 231),
            ),
            Text(
              'Item you lost',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontSize: 18.0,
                color: Color.fromARGB(255, 133, 37, 228),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
