import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mai_jo/packages/component/custom_text.dart';
import 'package:mai_jo/services/constant/path_images.dart';
import 'package:mai_jo/services/constant/paths_svg.dart';
import 'package:mai_jo/services/theme/app_colors.dart';

class BuildNewsAndCommunitySection extends StatelessWidget {
  final List<String> imagePaths = [
    PathImages.imageNews,
    PathImages.imageNews,
    PathImages.imageNews,
  ];
  BuildNewsAndCommunitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 24.w, top: 11.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 24.0.w),
            child: Row(
              children: [
                CustomText(
                  text: 'News & Community',
                  textColor: AppColors.fontcolor,
                  fontSize: 18.sp,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300,
                ),
                const Spacer(),
                CustomText(
                  text: 'See All',
                  textColor: AppColors.kPrimaryColor,
                  fontSize: 14.sp,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300,
                ),
                SizedBox(
                  width: 2.w,
                ),
                PathSvg.arrowHome
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: SizedBox(
              height: 158.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:
                    imagePaths.length, // Replace with your data array length
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 1.w),
                    child: Image.asset(
                      imagePaths[index], // Replace with your actual data
                      width: 302.w,
                      height: 158.h,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
