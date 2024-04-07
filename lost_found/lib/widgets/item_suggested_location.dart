import 'package:flutter/material.dart';
import 'package:lost_found/widgets/item_suggestion_location_list.dart';

class ItemSuggestedLocation extends StatelessWidget {
  final String description;
  const ItemSuggestedLocation({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: description,
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ItemSuggestedLocationLists(
                  iconData: Icons.local_parking,
                  text: "Parking",
                ),
                ItemSuggestedLocationLists(
                  iconData: Icons.kitchen,
                  text: "Mess",
                ),
                ItemSuggestedLocationLists(
                  iconData: Icons.school,
                  text: "Classroom",
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
        ],
      ),
    );
  }
}
