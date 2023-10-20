import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mai_jo/services/constant/paths_svg.dart';
import 'package:mai_jo/services/theme/app_colors.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final VoidCallback onBackButtonPressed;
  final Color backgroundColorIcon;

  CustomListTile({
    required this.title,
    required this.onTap,
    required this.onBackButtonPressed,
    required this.backgroundColorIcon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.w, horizontal: 17.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 14.sp, color: AppColors.fontcolor),
            ),
            GestureDetector(
              onTap: onBackButtonPressed,
              child: Container(
                width: 28.w,
                height: 28.h,
                decoration: BoxDecoration(
                  color: backgroundColorIcon,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: PathSvg.arrowSetting,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
