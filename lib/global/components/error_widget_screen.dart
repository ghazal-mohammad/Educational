import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/global/design/common_sizes.dart';

class ErrorWidgetScreen extends StatelessWidget {
  final String? message;
  final VoidCallback? onRetry;

  const ErrorWidgetScreen({
    super.key,
    this.message,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 60.sp,
              color: Colors.red,
            ),
            CommonSizes(height: 16.h),
            Text(
              message ?? 'Something went wrong',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.sp),
            ),
            if (onRetry != null) ...[
              CommonSizes(height: 16.h),
              ElevatedButton(
                onPressed: onRetry,
                child: const Text('Retry'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
