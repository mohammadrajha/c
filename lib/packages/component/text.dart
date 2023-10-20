import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildText(String customText, int customsize, Color colorText) {
  // لون افتراضي

  return Text(
    customText.tr(),
    style: TextStyle(
      color: colorText,
      fontSize: customsize.sp,
      fontFamily: 'poppins',
      fontWeight: FontWeight.w400,
    ),
  );
}
