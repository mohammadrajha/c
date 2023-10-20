import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mai_jo/packages/component/custom_text.dart';
import 'package:mai_jo/packages/views/home_page/component/build_feature_item.dart';
import 'package:mai_jo/services/constant/paths_svg.dart';
import 'package:mai_jo/services/theme/app_colors.dart';

class BuildFrequentlyUsedSection extends StatelessWidget {
  const BuildFrequentlyUsedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 26.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: CustomText(
              text: 'Frequently Used',
              textColor: AppColors.fontcolor,
              fontSize: 16.sp,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w300,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Row(
              children: [
                Expanded(
                  child: BuildFeatureItem(
                    iconColor: AppColors.bluelight,
                    iconLink: PathSvg.reorder,
                    title: 'Re-order',
                  ),
                ),
                Expanded(
                  child: BuildFeatureItem(
                    iconColor: AppColors.grayBackgroundLight,
                    iconLink: PathSvg.iconHome2,
                    title: 'All Stations',
                  ),
                ),
                Expanded(
                  child: BuildFeatureItem(
                    iconColor: AppColors.grayBackgroundLight,
                    iconLink: PathSvg.iconHome2,
                    title: 'My points',
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 17.h),
                    child: BuildFeatureItem(
                      iconColor: AppColors.grayBackgroundLight,
                      iconLink: PathSvg.iconHome3,
                      title: 'Customer\nService',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
