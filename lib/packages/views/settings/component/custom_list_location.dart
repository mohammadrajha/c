import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mai_jo/services/constant/paths_svg.dart';
import 'package:mai_jo/services/theme/app_colors.dart';

class CustomListLocationList extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final IconData leadingIcon; // أيقونة البداية
  final IconData trailingIcon; // أيقونة النهاية
  final VoidCallback onBackButtonPressed;
  final Color backgroundColorIcon;
  final Color backgroundColorIcontwo;

  CustomListLocationList({
    required this.title,
    required this.onTap,
    required this.leadingIcon,
    required this.trailingIcon,
    required this.onBackButtonPressed,
    required this.backgroundColorIcon,
    required this.backgroundColorIcontwo,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.5.w, horizontal: 17.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: PathSvg.locationSettingIcon),
            Text(
              title,
              style: TextStyle(fontSize: 14.sp, color: AppColors.fontcolor),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: GestureDetector(
                onTap: onBackButtonPressed,
                child: Container(
                  width: 28.w,
                  height: 28.h,
                  decoration: BoxDecoration(
                    color: backgroundColorIcon,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: PathSvg.editSetting,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: onBackButtonPressed,
              child: Container(
                width: 28.w,
                height: 28.h,
                decoration: BoxDecoration(
                  color: backgroundColorIcontwo,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: PathSvg.deleteSetting,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
