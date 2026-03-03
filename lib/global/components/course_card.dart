// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CourseCard extends StatelessWidget {
//   final String title;
//   final String instructor;
//   final String image;
//   final bool showProgress;
//   final double? progress;
//   final String? timeLeft;
//   final String? duration;
//   final String? level;
//   final VoidCallback? onTap;

//   const CourseCard({
//     super.key,
//     required this.title,
//     required this.instructor,
//     required this.image,
//     this.showProgress = false,
//     this.progress,
//     this.timeLeft,
//     this.duration,
//     this.level,
//     this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(12.w),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16.r),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Image.asset(image, width: 80.w, height: 60.h),
//               SizedBox(width: 10.w),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(title),
//                     Text(instructor),
//                   ],
//                 ),
//               ),
//             ],
//           ),

//           if (showProgress) ...[
//             SizedBox(height: 10.h),
//             LinearProgressIndicator(
//               value: progress,
//             ),
//             SizedBox(height: 6.h),
//             Text('$timeLeft left'),
//           ],

//           if (!showProgress && duration != null) ...[
//             SizedBox(height: 10.h),
//             Text('$duration • $level'),
//           ],
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final List<BoxShadow>? boxShadow;
  final double? width;
  final double? height;

  const AppCard({
    super.key,
    required this.child,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.padding,
    this.boxShadow,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding ?? EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(borderRadius ?? 16),
        border: borderColor != null
            ? Border.all(
                color: borderColor!,
                width: borderWidth ?? 1,
              )
            : null,
        boxShadow: boxShadow,
      ),
      child: child,
    );
  }
}