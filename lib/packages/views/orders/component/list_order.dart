import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mai_jo/packages/component/text.dart';
import 'package:mai_jo/services/constant/path_images.dart';
import 'package:mai_jo/services/constant/paths_svg.dart';
import 'package:mai_jo/services/theme/app_colors.dart';

class CustomListOrder extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  CustomListOrder({
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: buildText('13 May 2023', 15, Colors.black),
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: GestureDetector(
            onTap: onTap,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.circular(18.3.w), // تغير القيمة حسب الحاجة
                  child: Image.asset(
                    PathImages.imagePlaceHolder2,
                    width: 72.w,
                    height: 72.w,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 13.2.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 12.h),
                        child: Text(
                          title,
                          style: TextStyle(
                              fontSize: 16.sp, color: AppColors.fontcolor),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 5.w),
                            child: PathSvg.vector,
                          ),
                          Text(
                            "Order No. 33699",
                            style: TextStyle(
                                color: AppColors.fontcolorGray,
                                fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 5.w),
                            child: PathSvg.orderIcon,
                          ),
                          Text(
                            "In Progress",
                            style: TextStyle(
                                color: AppColors.yallowColor,
                                fontWeight: FontWeight.w300),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(bottom: 40.h),
                  child: PathSvg.statusYallow,
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        Divider()
      ],
    );
  }
}
