import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color textColor;
  final double fontSize;
  final String fontFamily;
  final FontWeight fontWeight;

  const CustomText({
    super.key,
    required this.text,
    this.textColor = Colors.white, // قيمة افتراضية للون الخط
    this.fontSize = 14.0, // قيمة افتراضية لحجم الخط
    this.fontFamily = 'Poppins', // قيمة افتراضية لنوع الخط
    this.fontWeight = FontWeight.w400, // قيمة افتراضية لوزن الخط
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize.sp,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
      ),
    );
  }
}
