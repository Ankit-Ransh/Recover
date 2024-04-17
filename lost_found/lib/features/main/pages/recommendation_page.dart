import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lost_found/core/common/widgets/text_title_widget.dart';
import 'package:lost_found/core/theme/app_pallete.dart';
import 'package:lost_found/features/main/widgets/lost_found_personal_item.dart';

class RecommendationPage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String category;

  const RecommendationPage({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.category,
  });

  static MaterialPageRoute route(
    String imageUrl,
    String title,
    String description,
    String category,
  ) {
    return MaterialPageRoute(
      builder: (context) => RecommendationPage(
        imageUrl: imageUrl,
        title: title,
        description: description,
        category: category,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            color: AppPallete.greyShade300,
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.fromLTRB(10, 5, 0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      CupertinoIcons.back,
                      size: 35,
                    ),
                  ),
                  const SizedBox(width: 20),
                  buildHeading(
                    "Items reported",
                    color: AppPallete.blackColor,
                    fontSize: 20,
                    bold: false,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),

          LostFoundPersonalItem(
            imageUrl: imageUrl,
            title: title,
            description: description,
            category: category,
          ),

          const SizedBox(height: 10),

          // Horizontal line

          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: AppPallete.greyShade300),
            ),
          ),

          Container(
            padding: const EdgeInsets.fromLTRB(30, 10, 10, 10),
            width: double.infinity,
            child: buildHeading(
              "Best match for your item",
              color: AppPallete.blackColor,
              fontSize: 24,
              bold: false,
            ),
          ),

          // // Recommended Cards
          // RecommendedCards(
          //   imageUrl: imageUrl,
          //   title: title,
          //   description: description,
          //   category: category,
          //   postedBy: "Amit",
          //   timeText: "3 hrs ago",
          // ),
        ],
      ),
    );
  }
}
