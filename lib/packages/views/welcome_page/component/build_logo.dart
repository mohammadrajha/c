import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../services/constant/paths_svg.dart';

Widget buildLogo() {
  return Column(
    children: [
      SizedBox(
        height: 112.h,
      ),
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 118.w,
        ),
        child: PathSvg.logoblue,
      ),
    ],
  );
}
