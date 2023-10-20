import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mai_jo/packages/component/navigation_bar.dart';
import 'package:mai_jo/packages/component/text.dart';
import 'package:mai_jo/packages/views/orders/component/list_order.dart';
import 'package:mai_jo/services/constant/paths_svg.dart';
import 'package:mai_jo/services/theme/app_colors.dart';

class OrdersPage extends StatelessWidget {
  static const String routename = 'OrdersPage';

  OrdersPage({super.key});
  final List<String> orders = [
    'Al-Raha station',
    'Another station',
    'And another station',
    //... يمكنك إضافة المزيد من العناصر هنا
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: 68.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  // تأكد من أن هذا العنصر صالح
                  PathSvg.iconBackgriund,
                  SizedBox(width: 10.w),
                  buildText('My orders', 16, AppColors.fontcolor),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: orders.length,
                itemBuilder: (BuildContext context, int index) {
                  return CustomListOrder(
                    onTap: () {
                      // هنا يمكنك تنفيذ الأكواد عند النقر على أحد العناصر
                    },
                    title: orders[index],
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const BootomNavigationBar(),
    );
  }
}
