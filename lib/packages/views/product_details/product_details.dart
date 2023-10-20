import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mai_jo/packages/component/custom_appbar.dart';
import 'package:mai_jo/packages/component/text.dart';
import 'package:mai_jo/packages/views/cart/cart_page.dart';
import 'package:mai_jo/packages/views/welcome_page/component/custom_build_button.dart';
import 'package:mai_jo/services/constant/path_images.dart';
import 'package:mai_jo/services/constant/paths_svg.dart';
import 'package:mai_jo/services/theme/app_colors.dart';

class ProductDetails extends StatefulWidget {
  static const String routename = 'ProductDetails';
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String? selectedSize = '20 L';
  String? selectedBottleType = 'New bottle';
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

  void updateButtonSelection(String size) {
    setState(() {
      selectedSize = size;
    });
  }

  void updateBottleSelection(String bottleType) {
    setState(() {
      selectedBottleType = bottleType;
    });
  }

  @override
  Widget build(BuildContext context) {
    int counter = 1;
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(
            title: 'Product Details',
            onBackButtonPressed: () {},
            iconColor: AppColors.kPrimaryColor,
            textColor: AppColors.fontcolor,
            backgroundColorIcon: AppColors.kPrimaryLight,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 28.h),
            child: Image.asset(
              PathImages.coolerProductDetails,
              width: 318.w,
              height: 165.h,
            ),
          ),
          SizedBox(
            height: 48.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.w, right: 30.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Cooler water bottle",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.fontcolor,
                  ),
                ),
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
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 14.w),
            child: buildText(
                'Choose the characteristics of the water bottle depending on the size and whether you want a new bottle  or just replace an existing bottle.',
                12,
                AppColors.lightGray),
          ),
          Padding(
            padding: EdgeInsets.only(right: 30.w, left: 30.w, top: 18.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildText('Item size', 12, AppColors.grayColorfont),
                    SizedBox(
                      height: 6.h,
                    ),
                    Row(
                      children: [
                        customButton(
                            '20 L',
                            selectedSize == '20 L'
                                ? const Color(0xFF0F89FF)
                                : Colors.black,
                            const Color(0xFFF3F9FF),
                            width: 48.w,
                            onPressed: () => updateButtonSelection('20 L')),
                        SizedBox(width: 10.w),
                        customButton(
                            '10 L',
                            selectedSize == '10 L'
                                ? const Color(0xFF0F89FF)
                                : Colors.black,
                            const Color(0xFFF3F9FF),
                            width: 48.w,
                            onPressed: () => updateButtonSelection('10 L')),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildText('New or replace?', 12, AppColors.fontcolor),
                    SizedBox(
                      height: 6.h,
                    ),
                    Row(
                      children: [
                        customButton(
                            'New',
                            selectedBottleType == 'New bottle'
                                ? const Color(0xFF0F89FF)
                                : Colors.black,
                            const Color(0xFFF3F9FF),
                            width: 81.w,
                            onPressed: () =>
                                updateBottleSelection('New bottle')),
                        SizedBox(width: 10.w),
                        customButton(
                            'Replace',
                            selectedBottleType == 'Refill bottle'
                                ? const Color(0xFF0F89FF)
                                : Colors.black,
                            const Color(0xFFF3F9FF),
                            width: 81.w,
                            onPressed: () =>
                                updateBottleSelection('Refill bottle')),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 22.h, left: 30.w, right: 30.w),
            child: buildText('Bottle price', 12, AppColors.fontcolor),
          ),
          Padding(
            padding: EdgeInsets.only(top: 2.h, left: 30.w, right: 30.w),
            child: buildText('1.00 JOD', 12, AppColors.kPrimaryColor),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 30.h),
        child: CustomBuildButton(
          text: 'Add to cart',
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(CartHome.routename);
          },
          fontColor: AppColors.bgWhite,
          buttonColor: AppColors.kPrimaryColor,
          borderColor: AppColors.none,
          svgIcon: 'assets/icons/shopping_cart_add.svg',
        ),
      ),
    );
  }
}

Widget customButton(String text, Color textColor, Color bgColor,
    {double width = 71, required VoidCallback onPressed}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      width: width,
      height: 48.h,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: textColor == const Color(0xFF0F89FF)
                ? const Color(0xFF0F89FF)
                : Colors.transparent),
      ),
      child: Center(
        child: Text(text, style: TextStyle(color: textColor, fontSize: 14.sp)),
      ),
    ),
  );
}
