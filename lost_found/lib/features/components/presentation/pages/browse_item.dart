import 'package:flutter/material.dart';
import 'package:lost_found/core/theme/app_pallete.dart';
import 'package:lost_found/features/components/presentation/widgets/cards.dart';
import 'package:lost_found/features/components/presentation/widgets/text_title_widget.dart';

class BrowseItem extends StatelessWidget {
  static route() => MaterialPageRoute(builder: (context) => const BrowseItem());
  const BrowseItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            color: AppPallete.lightGrey,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 5, 30, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  buildHeading("Browse reported items",
                      color: AppPallete.blackColor),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppPallete.greyColor),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        hintText: 'Search',
                        suffixIcon: Icon(
                          Icons.search,
                          color: AppPallete.lightPurple,
                          size: 30,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
          const Cards(
              title: "Notebook and Pen",
              description:
                  "Left my notebook & Pen In meeting room no 5. It has important client Meeting notes",
              user: "Deepika",
              time: 3,
              imageUrl:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfF2YcEpt1vTuV0UF4jSdhV-sVrvp3lo1y9kPsSTtCxw&s"),
        ],
      ),
    );
  }
}
