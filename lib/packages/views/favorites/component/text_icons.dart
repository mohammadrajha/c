import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextIcon extends StatelessWidget {
  const TextIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 20.w), // المسافة بين بداية السطر والأيقونة
        Icon(Icons.star), // يمكن استبدالها بالأيقونة المطلوبة
        SizedBox(width: 6.w), // المسافة بين الأيقونة والنص
        Text('Stations added to favorites'),
        Spacer(), // يقوم بإعطاء المسافة القصوى بين العنصر الأخير والذي قبله
        Icon(Icons.arrow_forward_ios), // يمكن استبدالها بالأيقونة المطلوبة
        SizedBox(width: 20.w), // المسافة بين الأيقونة وحافة السطر
      ],
    );
  }
}
