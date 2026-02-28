// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/global/design/color_app.dart';

class CommonSizes extends SizedBox {
  const CommonSizes({
    super.key,
    super.width,
    super.height,
    super.child,
  });

  static const TINY_LAYOUT_W_GAP = 10.0;
  static const SMALL_LAYOUT_W_GAP = 25.0;
  static const MED_LAYOUT_W_GAP = 50.0;
  static const BIG_LAYOUT_W_GAP = 75.0;
  static const BIGGER_LAYOUT_W_GAP = 100.0;
  static const BIGGEST_LAYOUT_W_GAP = 125.0;
  static const BORDER_RADIUS_STANDARD = 15.0;
  static const BORDER_RADIUS_CORNERS_BIG = 18.0;

  static final appBarHeight = 120.h;
  static final navBarHeight = 120.h;

  /// --------------- ///
  static const shrink = SizedBox.shrink();
  static final vSmallestSpace5v = CommonSizes(height: 5.h);
  static final vSmallestSpace = CommonSizes(height: 10.h);
  static final vPluSmallerSpace = CommonSizes(height: 15.h);
  static final vSmallerSpace = CommonSizes(height: 20.h);
  static final vSmallSpace = CommonSizes(height: 30.h);
  static final vBigSpace = CommonSizes(height: 40.h);
  static final vBiggerSpace = CommonSizes(height: 50.h);
  static final vBiggestSpace = CommonSizes(height: 60.h);
  static final vLargeSpace = CommonSizes(height: 70.h);
  static final vLargerSpace = CommonSizes(height: 80.h);
  static final vLargestSpace = CommonSizes(height: 90.h);
  static final vHugeSpace = CommonSizes(height: 100.h);
  static final vVeryHugeSpace = CommonSizes(height: 170.h);

  static final hTheSmallestSpace = CommonSizes(width: 5.w);
  static final hSmallestSpace = CommonSizes(width: 10.w);
  static final hSmallerSpace = CommonSizes(width: 20.w);
  static final hSmallSpace = CommonSizes(width: 30.w);
  static final hBigSpace = CommonSizes(width: 40.w);
  static final hBiggerSpace = CommonSizes(width: 50.w);
  static final hBiggestSpace = CommonSizes(width: 60.w);
  static final hLargeSpace = CommonSizes(width: 70.w);
  static final hLargerSpace = CommonSizes(width: 80.w);
  static final hLargestSpace = CommonSizes(width: 90.w);
  static final hHugeSpace = CommonSizes(width: 100.w);

  static divider(BuildContext context) => Divider(
    height: 1.5.h,
    color: ColorManager.grey.withValues(alpha: 0.2),
    thickness: 1.5.h,
  );
  static const spacer = Spacer();
}