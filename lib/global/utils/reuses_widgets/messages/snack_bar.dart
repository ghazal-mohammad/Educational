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
            color: isErrorMessage ? const Color(0xffFFF5F3) : Colors.green[100],
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: isErrorMessage ? const Color(0xffF4B0A1) : Colors.green,
              width: 2,
            ),
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
                    color: isErrorMessage ? Utils(context).red : const Color(0xff1daa61),
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
