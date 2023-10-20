import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mai_jo/model/station_model.dart';
import 'package:mai_jo/packages/component/custom_text.dart';
import 'package:mai_jo/packages/views/home_page/component/nearby_station/build_station_card.dart';
import 'package:mai_jo/packages/views/station_page/station_page.dart';
import 'package:mai_jo/services/constant/paths_svg.dart';
import 'package:mai_jo/services/theme/app_colors.dart';

import 'package:provider/provider.dart';

class NearbyStationHome extends StatelessWidget {
  const NearbyStationHome({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DataProvider>(context);
    final nearbyShops =
        provider.nearbyShops; // استخدم المتغير الجديد هنا للمحلات القريبة

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          StationPage.routename,
        );
      },
      child: Padding(
          padding: EdgeInsets.only(
            right: 27.w,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.only(left: 24.0.w, top: 32.h),
              child: Row(
                children: [
                  CustomText(
                    text: 'Nearby stations',
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
            SizedBox(
              height: 17.h,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30.h),
              child: SizedBox(
                height: 240.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: nearbyShops.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: BuildStationCard(shop: nearbyShops[index]),
                    );
                  },
                ),
              ),
            )
          ])),
    );
  }
}
