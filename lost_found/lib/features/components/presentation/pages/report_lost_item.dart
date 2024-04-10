import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lost_found/core/utils/pick_image.dart';
import 'package:lost_found/features/components/presentation/widgets/custom_app_bar.dart';
import 'package:lost_found/features/components/presentation/widgets/item_category.dart';
import 'package:lost_found/features/components/presentation/widgets/item_data.dart';
import 'package:lost_found/features/components/presentation/widgets/item_image_upload.dart';
import 'package:lost_found/features/components/presentation/widgets/item_lost_datetime.dart';
import 'package:lost_found/features/components/presentation/widgets/item_suggested_location.dart';
import 'package:lost_found/features/components/presentation/widgets/post_report_button.dart';
import 'package:lost_found/features/components/presentation/widgets/selected_image.dart';

class ReportLostItem extends StatefulWidget {
  const ReportLostItem({super.key});

  @override
  State<ReportLostItem> createState() => _ReportLostItemState();
}

class _ReportLostItemState extends State<ReportLostItem> {
  final formKey = GlobalKey<FormState>();
  final itemDataTitleController = TextEditingController();
  final itemDataDescriptionController = TextEditingController();
  final selectedSuggestedLocation = TextEditingController();
  final selectedSuggestedCategory = TextEditingController();
  final selectedDate = TextEditingController();
  final selectedTime = TextEditingController();
  File? image;

  @override
  void dispose() {
    itemDataTitleController.dispose();
    itemDataDescriptionController.dispose();
    selectedSuggestedLocation.dispose();
    selectedSuggestedCategory.dispose();
    selectedDate.dispose();
    selectedTime.dispose();
    super.dispose();
  }

  void selectLostItemImage() async {
    final pickedImage = await pickImage();
    if (pickedImage != null) {
      setState(() {
        image = pickedImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: const CustomAppBar(
          title: "Report item you lost",
          leadingIcon: Icons.arrow_back_ios_new,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
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
                    fontSize: 14,
                    height: 150.0,
                    controller: itemDataDescriptionController,
                  ),
                  const SizedBox(height: 40.0),
                  ItemSuggestedLocation(
                    description: "Where do you think you have lost it?",
                    controller: selectedSuggestedLocation,
                  ),
                  if (image != null) ...[
                    const SizedBox(height: 20.0),
                    SelectedImage(
                      image: image,
                      onTap: selectLostItemImage,
                    ),
                    const SizedBox(height: 20.0),
                  ] else ...[
                    ItemImageUpload(
                      description: "Upload a picture of the item if you have",
                      onTap: selectLostItemImage,
                    ),
                  ],
                  ItemLostTime(
                    dateController: selectedDate,
                    timeController: selectedTime,
                  ),
                  const SizedBox(height: 30.0),
                  ItemCategory(
                    controller: selectedSuggestedCategory,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  PostReportButton(
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
