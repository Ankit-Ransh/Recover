import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:lost_found/core/common/widgets/item_tags.dart';
import 'package:lost_found/core/common/widgets/text_title_widget.dart';
import 'package:lost_found/core/theme/app_pallete.dart';
import 'package:lost_found/features/main/widgets/tag.dart';

class RecommendedCards extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String category;
  final String postedBy;
  final String timeText;
  final String status;

  const RecommendedCards({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.category,
    required this.postedBy,
    required this.timeText,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      margin: const EdgeInsets.only(top: 10),
      // decoration: BoxDecoration(
      //   border: Border.all(color: AppPallete.greyColor),
      // ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 150,
            width: 130,
            margin: const EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              border: Border.all(color: AppPallete.transparentColor),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    height: 150,
                    width: 130,
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Tag(
                  status: status,
                  color: (status == "Lost")
                      ? AppPallete.lostColor
                      : AppPallete.foundColor,
                  fontSize: 14,
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          // ignore: sized_box_for_whitespace
          Container(
            height: 150,
            width: 180,
            // decoration: BoxDecoration(
            //   border: Border.all(color: AppPallete.greyColor),
            // ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildHeading(
                  title,
                  color: AppPallete.blackColor,
                  fontSize: 14,
                ),
                AutoSizeText(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  minFontSize: 8,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
                // ignore: sized_box_for_whitespace
                Container(
                  height: 35,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ItemTags(
                        category: category,
                        fontSize: 12,
                      ),
                      const SizedBox(width: 5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          buildHeading(
                            'Posted by $postedBy',
                            fontSize: 9,
                          ),
                          buildHeading(
                            timeText,
                            fontSize: 9,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
