import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../services/theme/app_colors.dart';

class CustomButtonLanguage extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ValueNotifier<String> selectedLanguage;
  final String fontFamily;
  const CustomButtonLanguage({
    super.key,
    required this.text,
    required this.onPressed,
    required this.selectedLanguage,
    required this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: selectedLanguage,
      builder: (context, value, child) {
        bool isSelected = value == text;
        return SizedBox(
          width: 113.w,
          height: 48.h,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                isSelected ? AppColors.kPrimaryLight : AppColors.bgWhite,
              ),
              side: MaterialStateProperty.resolveWith<BorderSide>(
                (Set<MaterialState> states) {
                  return BorderSide(
                      color: isSelected
                          ? AppColors.kPrimaryLight
                          : AppColors.kPrimaryLight,
                      width: 1.0.w);
                },
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              elevation: MaterialStateProperty.all(0.0),
            ),
            child: Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isSelected
                      ? AppColors.kPrimaryColor
                      : AppColors.fontcolor,
                  fontSize: 15.0.sp,
                  fontFamily: fontFamily,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
