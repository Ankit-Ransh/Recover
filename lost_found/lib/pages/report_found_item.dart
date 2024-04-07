import 'package:flutter/material.dart';
import 'package:lost_found/widgets/item_category.dart';
import 'package:lost_found/widgets/item_collection_center.dart';
import 'package:lost_found/widgets/item_description.dart';
import 'package:lost_found/widgets/item_image_upload.dart';
import 'package:lost_found/widgets/item_suggested_location.dart';
import 'package:lost_found/widgets/item_title.dart';

class ReportFoundItem extends StatefulWidget {
  const ReportFoundItem({super.key});

  @override
  State<ReportFoundItem> createState() => _ReportFoundItemState();
}

class _ReportFoundItemState extends State<ReportFoundItem> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    String title;
    String selectedItem = "Security";

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {},
          ),
          title: const Text(
            "Report item you found",
            textDirection: TextDirection.ltr,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const ItemTitle(),
                      const SizedBox(height: 20.0),
                      const ItemDescription(
                        description:
                            "Add an accurate description for the item you found",
                        fontSize: 13.5,
                      ),
                      const SizedBox(height: 40.0),
                      const ItemSuggestedLocation(
                        description: "Where did you find it?",
                      ),
                      const ItemImageUpload(
                        description: "Click the picture of the item",
                      ),
                      ItemCollectionCenter(
                        selectedItem: selectedItem,
                        onChanged: (String newValue) {
                          setState(() {
                            selectedItem = newValue;
                          });
                        },
                      ),
                      const SizedBox(height: 30.0),
                      const ItemCategory(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.zero,
                    padding: EdgeInsets.zero,
                  ),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 22, 45, 196),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Post",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
