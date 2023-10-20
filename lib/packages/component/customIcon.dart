import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mai_jo/services/theme/app_colors.dart';

class CustomContainer extends StatelessWidget {
  final String svgAsset;
  final Color bgColor;
  final double width;
  final double height;
  final double iconWidth;
  final double iconHeight;
  final VoidCallback? onTap; // هذا المعامل الجديد

  CustomContainer({
    required this.svgAsset,
    required this.bgColor,
    this.width = 34.0,
    this.height = 34.0,
    this.iconWidth = 18.0,
    this.iconHeight = 18.0,
    this.onTap, // تحديد المعامل هنا
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // استخدمنا GestureDetector هنا
      onTap: onTap,
      child: Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(4.0.r),
        ),
        child: Center(
          child: SvgPicture.asset(
            svgAsset,
            color: AppColors.bgWhite,
            width: iconWidth.w,
            height: iconHeight.h,
          ),
        ),
      ),
    );
  }
}
