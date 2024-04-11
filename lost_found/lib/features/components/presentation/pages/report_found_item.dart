import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_found/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:lost_found/core/common/widgets/loader.dart';
import 'package:lost_found/core/utils/pick_image.dart';
import 'package:lost_found/core/utils/show_snackbar.dart';
import 'package:lost_found/features/components/presentation/found_bloc/found_item_bloc.dart';
import 'package:lost_found/features/components/presentation/pages/home_page.dart';
import 'package:lost_found/features/components/presentation/widgets/custom_app_bar.dart';
import 'package:lost_found/features/components/presentation/widgets/item_category.dart';
import 'package:lost_found/features/components/presentation/widgets/item_collection_center.dart';
import 'package:lost_found/features/components/presentation/widgets/item_data.dart';
import 'package:lost_found/features/components/presentation/widgets/item_image_upload.dart';
import 'package:lost_found/features/components/presentation/widgets/item_suggested_location.dart';
import 'package:lost_found/features/components/presentation/widgets/post_report_button.dart';
import 'package:lost_found/features/components/presentation/widgets/selected_image.dart';

class ReportFoundItem extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const ReportFoundItem());

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
  File? image;
  String selectedItem = "Security";

  @override
  void dispose() {
    itemDataTitleController.dispose();
    itemDataDescriptionController.dispose();
    suggestedRecoveryLocation.dispose();
    suggestedRecoveryCategory.dispose();
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

  void reportCurrentFounditem() {
    if (formKey.currentState!.validate() && image != null) {
      final userId =
          (context.read<AppUserCubit>().state as AppUserLoggedIn).user.id;

      context.read<FoundItemBloc>().add(
            FoundItemReportStatus(
              userId: userId,
              title: itemDataTitleController.text.trim(),
              description: itemDataDescriptionController.text.trim(),
              foundLocation: suggestedRecoveryLocation.text.trim(),
              foundItemImage: image!,
              itemCollectionLocation: selectedItem,
              itemCategory: suggestedRecoveryCategory.text.trim(),
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: const CustomAppBar(
          title: "Report item you found",
          leadingIcon: Icons.arrow_back_ios_new,
        ),
        body: BlocConsumer<FoundItemBloc, FoundItemState>(
          listener: (context, state) {
            if (state is FoundItemFailure) {
              showSnackBar(context, state.message);
            } else if (state is FoundItemSuccess) {
              Navigator.pushAndRemoveUntil(
                  context, HomePage.route(), (route) => false);
            }
          },
          builder: (context, state) {
            if (state is FoundItemLoading) {
              return const Loader();
            }
            return SingleChildScrollView(
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
                          if (image != null) ...[
                            const SizedBox(height: 20.0),
                            SelectedImage(
                              image: image,
                              onTap: selectLostItemImage,
                            ),
                            const SizedBox(height: 20.0),
                          ] else ...[
                            ItemImageUpload(
                              description: "Click the picture of the item",
                              onTap: selectLostItemImage,
                            ),
                          ],
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
                    PostReportButton(
                      onTap: () {
                        reportCurrentFounditem();
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
