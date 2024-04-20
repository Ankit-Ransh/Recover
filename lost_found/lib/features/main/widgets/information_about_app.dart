import 'package:flutter/material.dart';
import 'package:lost_found/core/theme/app_pallete.dart';
import 'package:lost_found/core/common/widgets/text_description_widget.dart';
import 'package:lost_found/core/common/widgets/text_title_widget.dart';

class InformationAboutApp extends StatelessWidget {
  const InformationAboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
      child: Container(
        height: 200.0,
        decoration: BoxDecoration(
          border: Border.all(color: AppPallete.greyColor),
          borderRadius: BorderRadius.circular(15),
          gradient: AppPallete.gradient,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildHeading(
                    "Learn How does this work?",
                    fontSize: 18.0,
                    color: AppPallete.whiteColor,
                    bold: true,
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return const InformationModal();
                        },
                      );
                    },
                    child: const Icon(
                      Icons.ads_click_sharp,
                      color: AppPallete.whiteColor,
                      size: 26,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildDescription(
                        "Tap to learn about how we",
                        fontSize: 13,
                        color: AppPallete.whiteColor,
                      ),
                      buildDescription(
                        "help you find your lost item or to",
                        fontSize: 13,
                        color: AppPallete.whiteColor,
                      ),
                      buildDescription(
                        "reach the right owner",
                        fontSize: 13,
                        color: AppPallete.whiteColor,
                      ),
                    ],
                  ),
                  Image.asset(
                    'lib/core/assets/images/connect.gif',
                    height: 140,
                    width: 70,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InformationModal extends StatelessWidget {
  const InformationModal({super.key});
  final double headingFontSize = 15.0;
  final double descriptionFontSize = 13.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 800,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 2),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.article_outlined,
                size: 50.0,
                color: AppPallete.deepPurple,
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(40, 10, 30, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildHeading("When you report a lost item",
                    fontSize: headingFontSize),
                const SizedBox(height: 5),
                buildDescription(
                  "We provide you the best match",
                  fontSize: descriptionFontSize,
                ),
                buildDescription(
                  "recommendation of similar items reported by",
                  fontSize: descriptionFontSize,
                ),
                buildDescription(
                  "the finders which increase the chance of",
                  fontSize: descriptionFontSize,
                ),
                buildDescription(
                  "finding your items.",
                  fontSize: descriptionFontSize,
                ),
                const SizedBox(height: 5),
                buildHeading(
                  "When you report an item you found",
                  fontSize: headingFontSize,
                ),
                const SizedBox(height: 5),
                buildDescription(
                  "We provide you the best match",
                  fontSize: descriptionFontSize,
                ),
                buildDescription(
                  "recommendation of similar items reported by",
                  fontSize: descriptionFontSize,
                ),
                buildDescription(
                  "the owners. You can reduce their anxiety to by",
                  fontSize: descriptionFontSize,
                ),
                buildDescription(
                  "connecting with them as you find the right",
                  fontSize: descriptionFontSize,
                ),
                buildDescription(
                  "match",
                  fontSize: descriptionFontSize,
                ),
                const SizedBox(height: 10),
                buildHeading("Also, get notified on newly added reports if its",
                    fontSize: descriptionFontSize, bold: false),
                buildHeading("a match!",
                    fontSize: descriptionFontSize, bold: false),
                const SizedBox(height: 15),
                const CloseModalButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CloseModalButton extends StatelessWidget {
  const CloseModalButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: AppPallete.blackColor),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Center(
          child: buildDescription(
            "Cool",
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
