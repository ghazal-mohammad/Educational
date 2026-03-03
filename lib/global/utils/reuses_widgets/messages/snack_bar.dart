import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/global/utils/consts/assets.dart';

import '../../../design/themes/themes.dart';

void snackBar({
  required BuildContext context,
  required String title,
  bool isErrorMessage = false,
  bool? isIcon = true,
  Widget? icon,
  Duration duration = const Duration(seconds: 3),
}) {
  final overlay = Overlay.of(context);
  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      bottom: 10.h,
      left: 20.w,
      right: 20.w,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: isErrorMessage
                ? const Color(0xffFFF5F3)
                : const Color(0xFFF4EFFF), // موف فاتح للنجاح
            borderRadius: BorderRadius.circular(14.r),
            border: Border.all(
              color: isErrorMessage
                  ? const Color(0xffF4B0A1)
                  : const Color(0xFF331E53), // موف غامق للحواف
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                offset: const Offset(0, 6),
                blurRadius: 18,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              isIcon!
                  ? Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Image.asset(
                    isErrorMessage ? AppAssets.falseIcon : AppAssets.trueIcon,
                    scale: 2.9,
                    color: isErrorMessage
                        ? Utils(context).red
                        : const Color(0xFF331E53), // موف بدل الأخضر
                  ))
                  : icon ?? const SizedBox(),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (isErrorMessage)
                      Text('something_went_wrong'.tr(), style: Utils(context).titleBold),
                    Text(
                      title,
                      style: Utils(context).titleMuted,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );

  overlay.insert(overlayEntry);

  Future.delayed(duration, () {
    overlayEntry.remove();
  });
}
