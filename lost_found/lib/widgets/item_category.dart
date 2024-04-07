import 'package:flutter/material.dart';
import 'package:lost_found/widgets/item_possible_category.dart';

class ItemCategory extends StatelessWidget {
  const ItemCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Additional details",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Category (This will help in getting better match)",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Wrap(
              children: [
                ItemPossibleCategory(
                  text: "Stationary",
                ),
                ItemPossibleCategory(
                  text: "Gadget",
                ),
                ItemPossibleCategory(
                  text: "Keys",
                ),
                ItemPossibleCategory(
                  text: "Purse",
                ),
                ItemPossibleCategory(
                  text: "Others",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
