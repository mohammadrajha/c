import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mai_jo/packages/component/custom_text.dart';
import 'package:mai_jo/services/theme/app_colors.dart';

class BuildFeatureItem extends StatelessWidget {
  final String title;

  final Color iconColor;
  final Widget iconLink;
  const BuildFeatureItem(
      {super.key,
      required this.title,
      required this.iconColor,
      required this.iconLink});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 67.w,
          height: 67.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: iconLink,
        ),
        SizedBox(height: 8.h),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.fontcolor,
            fontSize: 12.sp,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
