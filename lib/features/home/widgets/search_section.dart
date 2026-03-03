import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lms/global/utils/consts/assets.dart';

const Color _border = Color(0xFFB7A4C6);
const Color _purple = Color(0xFF331E53);
const Color _textColor = Color(0xFF574C69);

class SearchSection extends StatelessWidget {
  final TextEditingController controller;
  const SearchSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38.h,
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: _border, width: 0.5),
        borderRadius: BorderRadius.circular(12.r),
      ),
      alignment: Alignment.centerLeft,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.text,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: _textColor,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Search course, topic, mentor...',
          hintStyle: TextStyle(
            color: _purple,
            fontFamily: 'Inter',
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
          isCollapsed: true,
          contentPadding: EdgeInsets.only(top: 0.1.h),
          prefixIcon: SvgPicture.asset(
            AppAssets.search,
            colorFilter: const ColorFilter.mode(
              _textColor,
              BlendMode.srcIn,
            ),
          ),
          prefixIconConstraints: BoxConstraints(
            minWidth: 13.w,
            minHeight: 13.h,
          ),
        ),
      ),
    );
  }
}