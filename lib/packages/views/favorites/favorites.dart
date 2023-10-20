import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mai_jo/model/station_model.dart';
import 'package:mai_jo/packages/component/navigation_bar.dart';
import 'package:mai_jo/packages/views/favorites/component/build_header.dart';
import 'package:mai_jo/packages/views/favorites/component/build_serch.dart';
import 'package:mai_jo/packages/views/favorites/component/text_icons.dart';
import 'package:mai_jo/packages/views/home_page/component/build_header_section.dart';
import 'package:mai_jo/packages/views/all_station/nearby_station.dart';
import 'package:mai_jo/services/theme/app_colors.dart';
import 'package:provider/provider.dart'; // إضافة مكتبة provider

class FavoritesPage extends StatelessWidget {
  static const String routename = 'FavoritesPage';
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // هذا سيقوم بجلب قائمة المفضلة من الموديل
    List<Shop> favoriteShops = Provider.of<DataProvider>(context).favorites;

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
          SizedBox(
            height: 26.h,
          ),
          Expanded(child: Consumer<DataProvider>(
            builder: (ctx, provider, child) {
              return ListView.builder(
                itemCount: provider.favorites.length,
                itemBuilder: (context, index) {
                  final shop = provider.favorites[index];
                  return ShopItem(shop: shop);
                },
              );
            },
          )),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const BootomNavigationBar(),
    );
  }
}
