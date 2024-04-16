import 'package:flutter/material.dart';
import 'package:lost_found/core/common/widgets/text_description_widget.dart';
import 'package:lost_found/core/theme/app_pallete.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          const SizedBox(height: 25),
          Container(
            alignment: AlignmentDirectional.center,
            height: 40,
            width: double.infinity,
            // decoration: BoxDecoration(
            //   border: Border.all(color: AppPallete.blackColor),
            // ),
            child: buildDescription(
              "Profile",
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            alignment: AlignmentDirectional.center,
            height: 120,
            width: double.infinity,
            // decoration: BoxDecoration(
            //   border: Border.all(color: AppPallete.blackColor),
            // ),
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: GestureDetector(
                  onTap: () {},
                  child: Image.network(
                    'https://media.vanityfair.com/photos/5346b75f6294062e550004e3/master/pass/s-vfh-alexandra-daddario-true-detective.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// child: ClipRRect(
//               child: Image.network(
//                 'https://media.vanityfair.com/photos/5346b75f6294062e550004e3/master/pass/s-vfh-alexandra-daddario-true-detective.jpg',
//               ),
//             ),