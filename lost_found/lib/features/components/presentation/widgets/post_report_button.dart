import 'package:flutter/material.dart';
import 'package:lost_found/core/theme/app_pallete.dart';

class PostReportButton extends StatelessWidget {
  final Function onTap;
  const PostReportButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
      ),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: AppPallete.deepPurple,
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Post",
              style: TextStyle(
                fontSize: 20.0,
                color: AppPallete.whiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
