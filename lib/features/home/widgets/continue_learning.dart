import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/global/components/course_card.dart';
import 'package:lms/global/design/common_sizes.dart';
import 'package:lms/global/utils/consts/assets.dart';

const Color _purple = Color(0xFF331E53);
const Color _border = Color(0xFFB7A4C6);
const Color _textColor = Color(0xFF574C69);

class ContinueLearningSection extends StatelessWidget {
  const ContinueLearningSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Continue Learning',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontFamily: 'Ubuntu',
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: _purple,
          ),
        ),
        AppCard(
          backgroundColor: _border.withValues(alpha: 0.2),
          borderRadius: 18.r,
          height: 160.h,
          width: double.infinity,
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.0.w),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: Image.asset(
                        AppAssets.im1,
                        width: 105.w,
                        height: 79.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0.w, bottom: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Complete React\nDevelopment',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: _purple,
                          ),
                        ),
                        Text(
                          'Michael Torres',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                            color: _textColor,
                          ),
                        ),
                        const CommonSizes(
                          height: 6,
                        ),
                        CommonSizes(
                          width: 220.w,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.r),
                            child: LinearProgressIndicator(
                              borderRadius: BorderRadius.circular(12.r),
                              value: 0.75,
                              backgroundColor: const Color(0xFF808792),
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                Color(0xFF00C2AC),
                              ),
                              minHeight: 6.h,
                            ),
                          ),
                        ),
                        const CommonSizes(
                          height: 4,
                        ),
                        Row(
                          children: [
                            Text(
                              '68% complete',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 10.sp,
                                color: const Color(0xFF00C2AC),
                              ),
                            ),
                            const CommonSizes(width: 60),
                            Text(
                              '4h 20m left',
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
                ],
              ),
              CommonSizes(
                width: double.infinity,
                height: 30.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _border.withValues(alpha: 0.6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Continue Course',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: _purple,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
