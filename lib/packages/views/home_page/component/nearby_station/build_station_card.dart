import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mai_jo/model/station_model.dart';
import 'package:mai_jo/packages/views/all_station/nearby_station.dart'; // تأكد من استيراد النموذج المناسب
import 'package:mai_jo/services/constant/paths_svg.dart';
import 'package:mai_jo/services/theme/app_colors.dart';
import 'package:provider/provider.dart';

class BuildStationCard extends StatelessWidget {
  final Shop shop; // نموذج المحل

  const BuildStationCard({required this.shop, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w),
      child: Container(
        width: 274.w,
        height: 274.h,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(.2)),
          borderRadius: BorderRadius.circular(18.3.r),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: 274
                      .w, // استخدم نفس القيم للعرض والارتفاع للـ SizedBox والـ ClipRRect
                  height: 139.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18.3.r),
                    child: Image.asset(
                      shop.imageUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 14.h,
                  right: 15.w,
                  child: GestureDetector(
                    onTap: () {
                      final provider =
                          Provider.of<DataProvider>(context, listen: false);
                      if (provider.isFavorite(shop)) {
                        provider.removeFavorite(shop);
                      } else {
                        provider.addFavorite(shop);
                      }
                    },
                    child: Consumer<DataProvider>(
                      builder: (ctx, provider, child) {
                        bool isFav = provider.isFavorite(shop);
                        return Container(
                          width: 22.w,
                          height: 22.h,
                          child: Icon(
                            isFav ? Icons.favorite_border : Icons.favorite,
                            color: isFav ? AppColors.lightGray : Colors.red,
                            size: 25.r,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 11.h),
            // Station text
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 21.w),
                child: Text(
                  shop.name,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.fontcolor,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 12.h),

            Row(
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: PathSvg.stationIcon),
                SizedBox(width: 6.w),
                Text(
                  shop.location,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.fontcolorGray,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),

            Row(
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: PathSvg.starIcon),
                SizedBox(width: 5.w),
                Text(
                  '${shop.rate} (${shop.numberOfUser} Reviews)',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.fontcolorGray,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
