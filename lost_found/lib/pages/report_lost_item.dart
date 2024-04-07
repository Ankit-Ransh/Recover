import 'package:flutter/material.dart';
import 'package:lost_found/widgets/item_category.dart';
import 'package:lost_found/widgets/item_description.dart';
import 'package:lost_found/widgets/item_image_upload.dart';
import 'package:lost_found/widgets/item_lost_time.dart';
import 'package:lost_found/widgets/item_suggested_location.dart';
import 'package:lost_found/widgets/item_title.dart';

class ReportLostItem extends StatefulWidget {
  const ReportLostItem({super.key});

  @override
  State<ReportLostItem> createState() => _ReportLostItemState();
}

class _ReportLostItemState extends State<ReportLostItem> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    String title;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {},
          ),
          title: const Text(
            "Report item you lost",
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
                  child: const Column(
                    children: [
                      ItemTitle(),
                      SizedBox(height: 20.0),
                      ItemDescription(
                        description:
                            "Add an accurate description for the item you lost",
                        fontSize: 14.0,
                      ),
                      SizedBox(height: 40.0),
                      ItemSuggestedLocation(
                        description: "Where do you think you have lost it?",
                      ),
                      ItemImageUpload(
                        description: "Upload a picture of the item if you have",
                      ),
                      ItemLostTime(),
                      SizedBox(height: 30.0),
                      ItemCategory(),
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
