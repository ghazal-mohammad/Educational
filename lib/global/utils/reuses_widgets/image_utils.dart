import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lms/global/design/common_sizes.dart';
import 'package:shimmer/shimmer.dart';

import '../consts/assets.dart';
class ImageUtils extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final double scale;
  final double? radius;
  final BoxFit fit;
  final Widget? errorWidget;
  final Widget? placeholder;
  final Color? borderColor;
  final bool isCircular;
  final File? imageFile;
  final bool shimmerLoading;
  final bool clickToExpandView;
  final bool matchTextDirection;
  final Color? tintColor;

  const ImageUtils({
    super.key,
    required this.imageUrl,
    this.width,
    this.borderColor,
    this.radius,
    this.height,
    this.scale = 1.0,
    this.fit = BoxFit.cover,
    this.errorWidget,
    this.placeholder,
    this.isCircular = false,
    this.imageFile,
    this.shimmerLoading = false,
    this.clickToExpandView = false,
    this.matchTextDirection = false,
    this.tintColor,
  });

  bool get _isAssetImage => imageUrl.startsWith('assets/');

  bool get _isValidNetworkUrl {
    if (imageUrl.isEmpty || imageUrl.trim().isEmpty) return false;
    try {
      final uri = Uri.parse(imageUrl);
      return uri.hasScheme &&
          (uri.scheme == 'http' || uri.scheme == 'https') &&
          uri.hasAuthority;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;
    if (_isAssetImage) {
      imageWidget = Image.asset(
        imageUrl,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (context, error, stackTrace) =>
            errorWidget ??
            _defaultErrorWidget(width, height, radius, borderColor),
        matchTextDirection: matchTextDirection,
      );

      if (tintColor != null) {
        imageWidget = ColorFiltered(
          colorFilter: ColorFilter.mode(
            tintColor!,
            BlendMode.srcIn,
          ),
          child: imageWidget,
        );
      }
    } else if (imageFile != null) {
      imageWidget = Image.file(
        imageFile!,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (context, error, stackTrace) =>
            errorWidget ??
            _defaultErrorWidget(width, height, radius, borderColor),
      );
    } else if (_isValidNetworkUrl) {
      imageWidget = CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        scale: scale,
        fit: fit,
        placeholder: (context, url) =>
            placeholder ??
            _defaultPlaceholder(width, height, radius, borderColor),
        errorWidget: (context, url, error) {
          return errorWidget ??
              _defaultErrorWidget(width, height, radius, borderColor);
        },
      );
    } else {
      // If URL is empty or invalid, show error widget directly
      imageWidget = errorWidget ??
          _defaultErrorWidget(width, height, radius, borderColor);
    }

    return clickToExpandView
        ? GestureDetector(
            onTap: () {
              // يمكنك تنفيذ واجهة عرض الصورة بشكل كامل هنا
            },
            child: _finalBuilder(imageWidget))
        : _finalBuilder(imageWidget);
  }

  Widget _defaultPlaceholder(
      double? w, double? h, double? r, Color? borderColor) {
    return shimmerLoading
        ? Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey,
          ),
        ),
      ),
    )
        : Container(
      width: w,
      height: h,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor ?? Colors.white),
        borderRadius: BorderRadius.circular(r ?? 180),
      ),
      child: const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _defaultErrorWidget(
      double? w, double? h, double? r, Color? borderColor) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor ?? Colors.white,
        ),
        borderRadius: BorderRadius.circular(r ?? 180.0),
      ),
      width: w,
      height: h,
      child: Center(
        child: Image.asset(AppAssets.logo),
      ),
    );
  }

  Widget _finalBuilder(Widget imageWidget) {
    if (isCircular) {
      return CommonSizes(
        width: width,
        height: height,
        child: ClipOval(child: imageWidget),
      );
    } else {
      return imageWidget;
    }
  }
}