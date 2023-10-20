import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mai_jo/services/theme/app_colors.dart';

class Serch extends StatelessWidget {
  const Serch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgWhite,
        borderRadius: BorderRadius.circular(12),
        border:
            Border.all(color: Colors.grey, width: 1), // هنا تمت إضافة الحدود
      ),
      child: TextField(
        decoration: InputDecoration(
          icon: Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: Icon(Icons.search),
          ),
          hintText: 'Search station, region or etc',
          contentPadding: EdgeInsets.only(right: 8.w),
          border: InputBorder.none,
          hintStyle: TextStyle(
            fontSize: 16.sp,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
