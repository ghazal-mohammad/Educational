import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/global/components/course_card.dart';
import 'package:lms/global/design/common_sizes.dart';
import 'package:lms/global/utils/consts/assets.dart';

const Color _purple = Color(0xFF331E53);
const Color _border = Color(0xFFB7A4C6);
const Color _textColor = Color(0xFF574C69);

class TopCoursesSection extends StatelessWidget {
  const TopCoursesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Top Courses',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: 'Ubuntu',
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: _purple,
              ),
            ),
            const CommonSizes(
              width: 129,
            ),
            Padding(
              padding: EdgeInsets.only(top: 4.w),
              child: TextButton.icon(
                onPressed: () {},
                label: Text(
                  'View all',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: _textColor,
                  ),
                ),
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 10.w,
                  color: const Color(0xFF6C627C),
                ),
                iconAlignment: IconAlignment.end,
              ),
            ),
          ],
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(4.w),
              child: AppCard(
                backgroundColor: Colors.white,
                borderRadius: 18.r,
                height: 125.h,
                width: double.infinity,
                borderColor: _border,
                borderWidth: 0.5.w,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 7.0.w),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: Image.asset(
                              AppAssets.im1,
                              width: 140.w,
                              height: 100.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 8.h,
                            left: 8.w,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.r),
                                color: _purple.withValues(alpha: 0.2),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 4.w),
                              child: Text(
                                "49\$",
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 8.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const CommonSizes(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Complete React\nDevelopment',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14.sp,
                              color: _purple,
                            ),
                          ),
                          Text(
                            'Michael Torres',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 10.sp,
                              color: _textColor,
                            ),
                          ),
                          const CommonSizes(height: 10),
                          Row(
                            children: [
                              Icon(
                                Icons.access_time_filled,
                                size: 10.w,
                                color: _textColor,
                              ),
                              const CommonSizes(width: 4),
                              Text(
                                '12h 30m',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 10.sp,
                                  color: _textColor,
                                ),
                              ),
                              const CommonSizes(width: 20),
                              Icon(
                                Icons.signal_cellular_alt,
                                size: 10.w,
                                color: _textColor,
                              ),
                              const CommonSizes(width: 4),
                              Text(
                                'Beginner',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 10.sp,
                                  color: _textColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 18.w,
                      color: _textColor,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
