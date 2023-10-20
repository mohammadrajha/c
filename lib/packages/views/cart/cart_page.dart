import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mai_jo/packages/views/cart/component/cart_appbar.dart';
import 'package:mai_jo/packages/views/cart/component/cart_card.dart';
import 'package:mai_jo/services/theme/app_colors.dart';

class CartHome extends StatelessWidget {
  static const String routename = 'CartHome';
  const CartHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bgWhite,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 71.h, left: 20.w, right: 20.w),
              child: AppbarCart(),
            ),
            SizedBox(
              height: 36.h,
            ),
            CartList()
          ],
        ));
  }
}
