import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mai_jo/packages/component/customIcon.dart';
import 'package:mai_jo/packages/component/custom_text.dart';
import 'package:mai_jo/services/constant/path_icons.dart';
import 'package:mai_jo/services/constant/paths_svg.dart';
import 'package:mai_jo/services/theme/app_colors.dart';

class BuildHeaderSection extends StatelessWidget {
  const BuildHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 253.h,
      decoration: BoxDecoration(
        color: const Color(0xFF0F89FF),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 56.h, left: 20.w, right: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomContainer(
                    svgAsset: PathIcons.mapPin,
                    bgColor: AppColors.wightLight,
                    width: 34.0, // حجم المربع في العرض
                    height: 34.0, // حجم المربع في الارتفاع
                    iconWidth: 18.0, // حجم الأيقونة في العرض
                    iconHeight: 18.0, // حجم الأيقونة في الارتفاع
                    onTap: () {}),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Delivery to',
                      textColor: AppColors.bgWhite,
                      fontSize: 12.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                    Row(
                      children: [
                        CustomText(
                          text: 'Abu Nsair - Amman',
                          textColor: AppColors.bgWhite,
                          fontSize: 14.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                        PathSvg.arrowDownWight
                      ],
                    )
                  ],
                ),
                Spacer(),
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    CustomContainer(
                      svgAsset: PathIcons.shopCart,
                      bgColor: AppColors.wightLight,
                      width: 34.0,
                      height: 34.0,
                      iconWidth: 20.0,
                      iconHeight: 20.0,
                      onTap: () {},
                    ),
                    Positioned(
                      right: 5
                          .w, // هذه القيمة تمثل مدى الإزاحة من اليمين. قد تحتاج إلى تعديلها حسب الحاجة
                      top: 7
                          .h, // وهذه القيمة تمثل مدى الإزاحة من الأعلى. قد تحتاج إلى تعديلها حسب الحاجة
                      child: Container(
                        padding: EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 6.w,
                          minHeight: 6.h,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 22.h),
            CustomText(
              text: 'Hello Adam!',
              textColor: AppColors.bgWhite,
              fontSize: 16.sp,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
            CustomText(
              text: 'Have a nice day',
              textColor: AppColors.bgWhite,
              fontSize: 14.sp,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: 22.h),
            Container(
              height: 48.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  SizedBox(width: 16.w),
                  PathSvg.serchIcon,
                  SizedBox(width: 8.w),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search station, product or etc',
                        hintStyle: TextStyle(
                          color: const Color(0xFF878787),
                          fontSize: 12.sp,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
