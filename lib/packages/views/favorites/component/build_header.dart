import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mai_jo/packages/views/favorites/component/build_serch.dart';
import 'package:mai_jo/services/constant/paths_svg.dart';
import 'package:mai_jo/services/theme/app_colors.dart';

class BuildHeader extends StatelessWidget {
  const BuildHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 113.h,
      child: Padding(
        padding: EdgeInsets.only(top: 64.h, left: 24.w, right: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 34.w,
                  height: 34.h,
                  color: AppColors.kPrimaryLight,
                  child: Icon(
                    Icons.pin_drop_outlined,
                    color: AppColors.kPrimaryColor,
                    size: 18.h,
                  ),
                ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Delivery to',
                      style: TextStyle(
                        color: AppColors.fontcolorGray,
                        fontSize: 14.sp,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Abu Nsair - Amman',
                      style: TextStyle(
                        color: AppColors.fontcolor,
                        fontSize: 14.sp,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      width: 34.w,
                      height: 34.h,
                      color: AppColors.kPrimaryLight,
                      child: PathSvg.card,
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        padding: EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 6,
                          minHeight: 6,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
