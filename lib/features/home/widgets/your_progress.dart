import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/global/components/course_card.dart';
import 'package:lms/global/design/common_sizes.dart';

const Color _purple = Color(0xFF331E53);
const Color _border = Color(0xFFB7A4C6);
const Color _textColor = Color(0xFF574C69);

class YourProgress extends StatelessWidget {
  const YourProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your Progress',
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
        CommonSizes(
          height: 115.h,
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 11.w,
              );
            },
            itemBuilder: (context, index) {
              return AppCard(
                width: 270.w,
                borderColor: _border,
                borderRadius: 18.r,
                borderWidth: 0.5.w,
                backgroundColor: Colors.white,
                child: Padding(
                  padding: EdgeInsets.only(left: 4.0.w, top: 5.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.r),
                            child: Container(
                              width: 60.w,
                              height: 60.h,
                              color: const Color(0xFF8B9CEF),
                              child: const Center(
                                child: Icon(
                                  Icons.code,
                                  color: Colors.black,
                                  size: 35,
                                ),
                              ),
                            ),
                          ),
                          CommonSizes(width: 10.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Basic HTML and CSS',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                    color: _purple,
                                  ),
                                ),
                                CommonSizes(height: 6.h),
                                Text(
                                  '58/68 Videos',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: _textColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      CommonSizes(height: 8.h),

                      /// Progress Bar
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: LinearProgressIndicator(
                          borderRadius: BorderRadius.circular(12.r),
                          value: 0.75,
                          minHeight: 6.h,
                          backgroundColor: const Color(0xFFE0E0E0),
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            Color(0xFF00C2AC),
                          ),
                        ),
                      ),

                      SizedBox(height: 6.h),

                      /// Progress Text
                      Text(
                        'Course Completed 85%',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF00C2AC),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: 3,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
