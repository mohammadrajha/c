import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../services/theme/app_colors.dart';

Widget customLinkText(
    String customText, int customsize, void Function()? ontap) {
  return GestureDetector(
    onTap: ontap,
    child: Text(
      customText
          .tr(), // استخدم المتغير هنا بدلاً من KeyLanguage.textwelcome.tr()
      // textAlign: TextAlign.center,
      style: TextStyle(
        color: AppColors.kPrimaryColor,
        fontSize: customsize.sp,
        fontFamily: 'poppins',
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
