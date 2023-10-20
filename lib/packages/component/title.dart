import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../services/theme/app_colors.dart';

Widget buildTitle(String customTitle) {
  return Text(
    customTitle.tr(),
    // textAlign: TextAlign.center,
    style: TextStyle(
      color: AppColors.fontcolor,
      fontSize: 18.sp,
      fontFamily: 'poppins',
      fontWeight: FontWeight.w700,
    ),
  );
}
