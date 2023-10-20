import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mai_jo/packages/component/text.dart';
import 'package:mai_jo/services/constant/path_images.dart';
import 'package:mai_jo/services/theme/app_colors.dart';

class CartList extends StatefulWidget {
  const CartList({super.key});

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  int counter = 1;
  void increment() {
    setState(() {
      counter++;
    });
  }

  void decrement() {
    setState(() {
      if (counter > 1) {
        counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: buildText('Al-Taqwa station', 18, AppColors.fontcolor),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Transform.translate(
              offset: Offset(20.w,
                  0), // هنا تم تحديد قيمة الانحراف بمقدار 20 وحدة في الاتجاه الأفقي
              child: Image.asset(
                PathImages.cooler,
                width: 104.w,
                height: 104.h,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildText('Water Bottle', 16, AppColors.fontcolor),
                  SizedBox(
                    height: 4.h,
                  ),
                  buildText('(20Ltr, New)', 14, AppColors.lightGray),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 80,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                decrement;
                              },
                              child: const Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Icon(
                                  CupertinoIcons.minus,
                                  size: 18,
                                ),
                              ),
                            ),
                            Text("$counter"),
                            GestureDetector(
                              onTap: () {
                                increment;
                              },
                              child: const Padding(
                                padding: EdgeInsets.only(right: 5),
                                child: Icon(
                                  CupertinoIcons.plus,
                                  size: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(Icons.star),
                  SizedBox(
                    height: 61.h,
                  ),
                  buildText('5.00 JOD', 16, AppColors.kPrimaryColor)
                ],
              ),
            )
          ],
        ),
        Divider()
      ],
    );
  }
}
