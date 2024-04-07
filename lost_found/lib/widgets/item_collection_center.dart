import 'package:flutter/material.dart';

class ItemCollectionCenter extends StatefulWidget {
  final String selectedItem;
  final ValueChanged<String> onChanged;

  const ItemCollectionCenter({
    Key? key,
    required this.selectedItem,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<ItemCollectionCenter> createState() => _ItemCollectionCenterState();
}

class _ItemCollectionCenterState extends State<ItemCollectionCenter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 330,
              child: DropdownButton<String>(
                value: widget.selectedItem,
                onChanged: (String? newValue) {
                  setState(() {
                    widget.onChanged(newValue!);
                  });
                },
                items: <String>[
                  "Security",
                  "Reception",
                  "Ground",
                  "Lab",
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
