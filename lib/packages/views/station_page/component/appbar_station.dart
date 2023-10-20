import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mai_jo/services/constant/path_images.dart';
import 'package:mai_jo/services/constant/paths_svg.dart';
import 'package:mai_jo/services/theme/app_colors.dart';

class AppbarStation extends StatelessWidget {
  const AppbarStation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 147.h,
      // color: AppColors.backgroundPagecard,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.r)),
            child: Container(
              width: 1.sw, // Use ScreenUtil for screen width
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(PathImages.stationImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 50.h,
              left: 20.w,
              right: 20.w,
            ),
            child: GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Container(
                    width: 35.w,
                    height: 35.h,
                    decoration: BoxDecoration(
                      color: AppColors.bgWhite,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: PathSvg.arrowLeft,
                    ),
                  ),
                  SizedBox(width: 13.w),
                  Text('Al-balad station',
                      style:
                          TextStyle(fontSize: 16.sp, color: AppColors.bgWhite)),
                  SizedBox(width: 6.w),
                  PathSvg.informationIcon,
                  Spacer(),
                  Icon(
                    Icons.favorite,
                    size: 24.w,
                    color: AppColors.bgWhite,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 92.h, left: 67.5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.add_location,
                  color: Colors.white,
                  size: 20.sp,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "Alshahid street -Abu Nsair",
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                ),
                SizedBox(
                  width: 20.w,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 117.h, left: 67.5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.add_location,
                  color: Colors.white,
                  size: 20.sp,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "AbuNsair",
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 20.sp,
                ),
                Text(
                  "4.9 (1K Reviews)",
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
