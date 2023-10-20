import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mai_jo/model/station_model.dart';
import 'package:mai_jo/packages/component/navigation_bar.dart';
import 'package:mai_jo/packages/views/favorites/component/build_header.dart';
import 'package:mai_jo/packages/views/favorites/component/build_serch.dart';
import 'package:mai_jo/packages/views/favorites/component/text_icons.dart';
import 'package:mai_jo/services/constant/path_images.dart';
import 'package:mai_jo/services/constant/paths_svg.dart';
import 'package:mai_jo/services/theme/app_colors.dart';
import 'package:provider/provider.dart';

class Shop {
  final String name;
  final String imageUrl;
  final String location;
  final String rate;
  final String numberOfUser;

  Shop({
    required this.name,
    required this.imageUrl,
    required this.location,
    required this.rate,
    required this.numberOfUser,
  });
}

class NearbyStation extends StatelessWidget {
  static const String routename = 'NearbyStation';
  NearbyStation({super.key});

  final List<Shop> shops = [
    Shop(
        name: 'Al-Raha station',
        imageUrl: PathImages.imagePlaceHolder2,
        location: 'Abu Nsair - Amman',
        rate: '4.9',
        numberOfUser: '+1000'),
    Shop(
        name: 'Al-Raha station2',
        imageUrl: PathImages.imagePlaceHolder2,
        location: 'Abu Nsair - Amman2',
        rate: '4.0',
        numberOfUser: '+2000'),
    // ... يمكنك إضافة المزيد من المحلات هنا
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      body: Column(
        children: [
          BuildHeader(),
          SizedBox(
            height: 40.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Serch(),
          ),
          SizedBox(
            height: 22.h,
          ),
          TextIcon(),
          Expanded(
            child: ListView.builder(
              itemCount: shops.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ShopItem(shop: shops[index]),
                    Divider(color: Colors.grey) // هنا نضيف الخط بعد كل عنصر
                  ],
                );
              },
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const BootomNavigationBar(),
    );
  }
}

class ShopItem extends StatefulWidget {
  final Shop shop;

  ShopItem({required this.shop});

  @override
  _ShopItemState createState() => _ShopItemState();
}

class _ShopItemState extends State<ShopItem> {
  bool isFavorite = false; // لتتبع حالة الأيقونة

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 24.w),
            width: 72.w,
            height: 72.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              image: DecorationImage(
                image: AssetImage(widget.shop.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 13.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.shop.name, style: TextStyle(fontSize: 17.sp)),
                SizedBox(
                  height: 6.h,
                ),
                Row(
                  children: [
                    PathSvg.marker,
                    SizedBox(width: 1.w),
                    Text(
                      widget.shop.location,
                      style: TextStyle(fontSize: 12.sp),
                    ),
                  ],
                ),
                SizedBox(height: 6.h),
                Row(
                  children: [
                    PathSvg.yallowstar,
                    SizedBox(width: 1.w),
                    Text(
                      ' ${widget.shop.rate} ${widget.shop.numberOfUser}',
                      style: TextStyle(fontSize: 12.sp),
                    ),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              final provider =
                  Provider.of<DataProvider>(context, listen: false);
              if (provider.isFavorite(widget.shop)) {
                provider.removeFavorite(widget.shop);
              } else {
                provider.addFavorite(widget.shop);
              }
            },
            child: Padding(
                padding: EdgeInsets.only(right: 20.w),
                child: Consumer<DataProvider>(
                  builder: (ctx, provider, child) {
                    bool isFavorite = provider.isFavorite(widget.shop);
                    return Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : AppColors.lightGray,
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }
}
