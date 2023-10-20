import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mai_jo/packages/component/navigation_bar.dart';
import 'package:mai_jo/services/constant/path_images.dart';
import 'package:mai_jo/services/constant/paths_svg.dart';
import 'package:mai_jo/services/theme/app_colors.dart';

class StationProfile extends StatelessWidget {
  const StationProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w, top: 50.h),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: 35.w,
                height: 35.h,
                decoration: BoxDecoration(
                  color: AppColors.kPrimaryLight,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: PathSvg.arrowLeft,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Row(
              children: [
                ClipRRect(
                  // استخدم ClipRRect هنا
                  borderRadius:
                      BorderRadius.circular(18), // تحديد نصف قطر الانحناء
                  child: Image.asset(
                    PathImages.imagePlaceHolder2,
                    width: 72.w,
                    height: 72.h,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Text('Al-balad station')
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 21.h, left: 20.w, right: 20.w),
              child: Row(
                children: [
                  ...List.generate(
                      5,
                      (index) => Icon(Icons.star,
                          color: Colors.yellow, size: 24)), // إضافة 5 نجوم

                  Text('4.9'),
                  Spacer(),
                  Text('1250 rate'),
                ],
              )),
          SizedBox(
            height: 21.h,
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.only(top: 21.h, left: 20.w, right: 20.w),
            child: Row(
              children: [Text('Station region'), Spacer(), Text('Abu Nsair')],
            ),
          ),
          SizedBox(
            height: 21.h,
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.only(top: 21.h, left: 20.w, right: 20.w),
            child: Row(
              children: [Text('Pre-order'), Spacer(), Text('Yes')],
            ),
          ),
          SizedBox(
            height: 21.h,
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.only(top: 21.h, left: 20.w, right: 20.w),
            child: Row(
              children: [
                Text('Work hours'),
                Spacer(),
                Text('8:00 AM - 8:00 PM')
              ],
            ),
          ),
          SizedBox(
            height: 21.h,
          ),
          Divider(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const BootomNavigationBar(),
    );
  }
}
