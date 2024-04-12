import 'package:flutter/material.dart';
import 'package:lost_found/core/theme/app_pallete.dart';

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
                  const Text(
                    "Learn How does this work?",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                      color: AppPallete.whiteColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.ads_click_sharp,
                      color: AppPallete.whiteColor,
                      size: 26,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tap to learn about how we",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppPallete.whiteColor,
                        ),
                      ),
                      Text(
                        "help you find your lost item or to",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppPallete.whiteColor,
                        ),
                      ),
                      Text(
                        "reach the right owner",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppPallete.whiteColor,
                        ),
                      ),
                    ],
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
