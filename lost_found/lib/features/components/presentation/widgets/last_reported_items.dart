import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lost_found/core/theme/app_pallete.dart';
import 'package:lost_found/features/components/presentation/widgets/small_card.dart';
import 'package:lost_found/features/components/presentation/widgets/text_title_widget.dart';

class LastReportedItems extends StatelessWidget {
  const LastReportedItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppPallete.greyShade200,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildHeading(
                  "Reported items in last 48hrs",
                  fontSize: 17,
                  bold: true,
                  color: AppPallete.blackColor,
                ),
                // GestureDetector(
                //   onTap: () {},
                //   child: const Icon(
                //     Icons.search,
                //     size: 35,
                //   ),
                // ),
              ],
            ),
          ),
          const Wrap(
            children: [
              SmallCard(
                imageUrl: 'https://m.media-amazon.com/images/I/518BCDyhijL.jpg',
                status: "Lost",
                title: "Notebook and Pen",
                location: "meeting room",
                postedBy: "Neha",
                time: 3,
                color: AppPallete.lostColor,
              ),
              SmallCard(
                imageUrl:
                    'https://thumbs.dreamstime.com/b/bunch-keys-leather-case-fell-to-ground-leaves-keys-leather-partholme-key-yellow-fallen-100724853.jpg',
                status: "Found",
                title: "Keys",
                location: "cafeteria",
                postedBy: "Tanya",
                time: 1,
                color: AppPallete.foundColor,
              ),
            ],
          )
        ],
      ),
    );
  }
}
