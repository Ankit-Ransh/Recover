import 'package:flutter/material.dart';
import 'package:lost_found/core/theme/app_pallete.dart';
import 'package:lost_found/features/components/presentation/widgets/item_suggestion_location_list.dart';

class ItemSuggestedLocation extends StatefulWidget {
  final String description;
  final TextEditingController controller;
  const ItemSuggestedLocation({
    super.key,
    required this.description,
    required this.controller,
  });

  @override
  State<ItemSuggestedLocation> createState() => _ItemSuggestedLocationState();
}

class _ItemSuggestedLocationState extends State<ItemSuggestedLocation> {
  String selectedLocation = "";
  final String hintText = "Please select a location";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(color: AppPallete.greyColor),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: selectedLocation.isEmpty
                  ? widget.description
                  : selectedLocation,
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return hintText;
              }

              return null;
            },
          ),
          const SizedBox(
            height: 20.0,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ItemSuggestedLocationLists(
                  iconData: Icons.local_parking,
                  text: "Parking",
                  controller: widget.controller,
                  isSelected: selectedLocation == "Parking",
                  onTap: () {
                    setState(() {
                      selectedLocation = "Parking";
                      widget.controller.text = selectedLocation;
                    });
                  },
                ),
                ItemSuggestedLocationLists(
                  iconData: Icons.kitchen,
                  text: "Mess",
                  controller: widget.controller,
                  isSelected: selectedLocation == "Mess",
                  onTap: () {
                    setState(() {
                      selectedLocation = "Mess";
                      widget.controller.text = selectedLocation;
                    });
                  },
                ),
                ItemSuggestedLocationLists(
                    iconData: Icons.school,
                    text: "Classroom",
                    controller: widget.controller,
                    isSelected: selectedLocation == "Classroom",
                    onTap: () {
                      setState(() {
                        selectedLocation = "Classroom";
                        widget.controller.text = selectedLocation;
                      });
                    }),
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
