import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mai_jo/packages/component/navigation_bar.dart';
import 'package:mai_jo/packages/component/text.dart';
import 'package:mai_jo/packages/views/product_details/product_details.dart';
import 'package:mai_jo/packages/views/station_page/component/appbar_station.dart';
import 'package:mai_jo/services/constant/path_images.dart';
import 'package:mai_jo/services/theme/app_colors.dart';

class StationPage extends StatelessWidget {
  static const String routename = 'StationPage';

  final List<Map<String, dynamic>> items = [
    {
      'name': 'Small Water Bottle',
      'price': '0.40 JOD / Per bottle',
      'image': PathImages.battel,
      'details': 'Details for the Small Water Bottle...',
    },
    {
      'name': 'Another Product',
      'price': '1.00 JOD / Per item',
      'image': PathImages.battel,
      'details': 'Details for the Another Product...',
    },
    // يمكن إضافة المزيد من العناصر هنا
  ];

  StationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppbarStation(),
          Padding(
            padding: EdgeInsets.only(top: 31.h, left: 20.w),
            child: Row(
              children: [Text('Trending'), Icon(Icons.star)],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Text(
                'The best-selling items in the recent period from this\n station'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item['name']),
                            Text(item['price']),
                            SizedBox(height: 15.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 34.w,
                                  height: 34.h,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Icon(Icons.home),
                                ),
                                SizedBox(width: 8.w),
                                Container(
                                  width: 34.w,
                                  height: 34.h,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pushNamed(
                                            ProductDetails.routename);
                                      },
                                      child: Icon(Icons.star)),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Image.asset(item['image'], width: 85.w, height: 85.h),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const BootomNavigationBar(),
    );
  }
}

// void showProductModalSheet(BuildContext context, String details) {
//   showModalBottomSheet<void>(
//     context: context,
//     backgroundColor: Colors.transparent,
//     builder: (BuildContext context) {
//       return ProductModalSheet(details: details);
//     },
//   );
// }

// class ProductModalSheet extends StatefulWidget {
//   final String details;
//   ProductModalSheet({Key? key, required this.details}) : super(key: key);

//   @override
//   _ProductModalSheetState createState() => _ProductModalSheetState();
// }

// class _ProductModalSheetState extends State<ProductModalSheet> {
//   int counter = 1;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(50.0),
//           topRight: Radius.circular(50.0),
//         ),
//       ),
//       child: SizedBox(
//         height: 700.h,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: EdgeInsets.only(top: 43.h, left: 28.w, right: 29.w),
//               child: Container(
//                 color: Colors.amber,
//                 width: 318.w,
//                 height: 130.h,
//                 child: Image.asset(
//                   PathImages.coolerProductDetails,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             // المزيد من المحتوى الذي ترغب في إضافته
//             Padding(
//               padding: EdgeInsets.only(top: 38.h, left: 30.w, right: 30.w),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Cooler water bottle",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: AppColors.fontcolor,
//                     ),
//                   ),
//                   Container(
//                     width: 80,
//                     padding: const EdgeInsets.all(5),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(8.r),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.2),
//                           spreadRadius: 1,
//                         ),
//                       ],
//                     ),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               if (counter > 1) counter--;
//                             });
//                           },
//                           child: const Padding(
//                             padding: EdgeInsets.only(left: 5),
//                             child: Icon(
//                               CupertinoIcons.minus,
//                               size: 18,
//                             ),
//                           ),
//                         ),
//                         Text("$counter"),
//                         GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               counter++;
//                             });
//                           },
//                           child: const Padding(
//                             padding: EdgeInsets.only(right: 5),
//                             child: Icon(
//                               CupertinoIcons.plus,
//                               size: 18,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 14.w),
//               child: buildText(
//                   'Choose the characteristics of the water bottle depending on the size and whether you want a new bottle  or just replace an existing bottle.',
//                   12,
//                   AppColors.lightGray),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
