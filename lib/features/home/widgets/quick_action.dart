import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/global/components/qick_action_card.dart';
import 'package:lms/global/design/common_sizes.dart';
import 'package:lms/global/utils/consts/assets.dart';

const Color _purple = Color(0xFF331E53);

class QuickAction extends StatelessWidget {
  const QuickAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Action',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontFamily: 'Ubuntu',
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: _purple,
          ),
        ),
        CommonSizes(
          height: 6.h,
        ),
        const Row(
          spacing: 4,
          children: [
            QuickActionCard(
              icon: AppAssets.libraryIcon,
              title: "My Library",
              value1: "12 ",
              value2: "Courses",
            ),
            QuickActionCard(
              icon: AppAssets.exerciseIcon,
              title: "Exercises",
              value1: "13 ",
              value2: "Exercises",
            ),
            QuickActionCard(
              icon: AppAssets.newsIcon,
              title: "Last News",
              value1: "3 ",
              value2: "New",
            ),
          ],
        )
      ],
    );
  }
}
