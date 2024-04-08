import 'package:flutter/material.dart';
import 'package:lost_found/features/components/presentation/widgets/custom_app_bar.dart';
import 'package:lost_found/features/components/presentation/widgets/item_category.dart';
import 'package:lost_found/features/components/presentation/widgets/item_collection_center.dart';
import 'package:lost_found/features/components/presentation/widgets/item_data.dart';
import 'package:lost_found/features/components/presentation/widgets/item_image_upload.dart';
import 'package:lost_found/features/components/presentation/widgets/item_suggested_location.dart';

class ReportFoundItem extends StatefulWidget {
  const ReportFoundItem({super.key});

  @override
  State<ReportFoundItem> createState() => _ReportFoundItemState();
}

class _ReportFoundItemState extends State<ReportFoundItem> {
  final formKey = GlobalKey<FormState>();
  final itemDataTitleController = TextEditingController();
  final itemDataDescriptionController = TextEditingController();
  final suggestedRecoveryLocation = TextEditingController();
  final suggestedRecoveryCategory = TextEditingController();
  String selectedItem = "Security";

  @override
  void dispose() {
    itemDataTitleController.dispose();
    itemDataDescriptionController.dispose();
    suggestedRecoveryLocation.dispose();
    suggestedRecoveryCategory.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: const CustomAppBar(
          title: "Report item you found",
          leadingIcon: Icons.arrow_back_ios_new,
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
                      ItemData(
                        hintText: "Title",
                        controller: itemDataTitleController,
                      ),
                      const SizedBox(height: 20.0),
                      ItemData(
                        hintText:
                            "Add an accurate description for the item you lost",
                        controller: itemDataDescriptionController,
                        fontSize: 14,
                        height: 150.0,
                      ),
                      const SizedBox(height: 40.0),
                      ItemSuggestedLocation(
                        description: "Where did you find it?",
                        controller: suggestedRecoveryLocation,
                      ),
                      const ItemImageUpload(
                        description: "Click the picture of the item",
                      ),
                      ItemCollectionCenter(
                        selectedItem: selectedItem,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedItem = newValue!;
                          });
                        },
                      ),
                      const SizedBox(height: 30.0),
                      ItemCategory(
                        controller: suggestedRecoveryCategory,
                      ),
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
