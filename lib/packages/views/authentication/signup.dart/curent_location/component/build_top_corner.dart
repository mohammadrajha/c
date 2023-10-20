import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mai_jo/services/theme/app_colors.dart';
import '../../../../../component/text.dart';
import '../../../../../component/title.dart';

Widget buildTopContainer(double screenWidth) {
  return Container(
    width: screenWidth,
    height: 142.0.h,
    color: Colors.white,
    padding: EdgeInsets.only(left: 20.0.w, right: 20.w, top: 68.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTitle('Where to delivery!'),
        buildText('Please choose your delivery default location', 14,
            AppColors.fontcolor),
      ],
    ),
  );
}
