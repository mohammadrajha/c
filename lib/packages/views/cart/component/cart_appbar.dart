import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mai_jo/packages/component/text.dart';
import 'package:mai_jo/services/constant/paths_svg.dart';
import 'package:mai_jo/services/theme/app_colors.dart';

class AppbarCart extends StatelessWidget {
  const AppbarCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PathSvg.iconBackgriund,
        SizedBox(
          width: 10.w,
        ),
        buildText('Cart', 16, AppColors.fontcolor),
        Spacer(),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 35.w,
            height: 35.h,
            decoration: BoxDecoration(
              color: AppColors.redLight,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: PathSvg.deleteSetting,
            ),
          ),
        ),
      ],
    );
  }
}
