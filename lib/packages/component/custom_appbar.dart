import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../services/constant/paths_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onBackButtonPressed;
  final IconData? endIcon; // الأيقونة الاختيارية
  final VoidCallback? onEndIconPressed;
  final Color iconColor;
  final Color textColor;
  final Color backgroundColorIcon;
  final String? linkImg;

  const CustomAppBar(
      {super.key,
      required this.title,
      required this.onBackButtonPressed,
      this.endIcon,
      this.onEndIconPressed,
      required this.iconColor,
      required this.textColor,
      required this.backgroundColorIcon,
      this.linkImg});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(top: 68.h, left: 20.w),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: onBackButtonPressed,
                  child: Container(
                    width: 35.w,
                    height: 35.h,
                    decoration: BoxDecoration(
                      color: backgroundColorIcon,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: PathSvg.arrowLeft,
                    ),
                  ),
                ),
                SizedBox(
                  width: 6.w,
                ),
                Text(
                  title,
                  style: TextStyle(fontSize: 16.sp, color: textColor),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: onEndIconPressed,
                  child: Icon(
                    endIcon,
                    color: iconColor,
                    size: 27.w,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
