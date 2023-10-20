import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mai_jo/packages/views/favorites/favorites.dart';
import 'package:mai_jo/packages/views/home_page/homepage.dart';
import 'package:mai_jo/packages/views/more/more.dart';
import 'package:mai_jo/packages/views/orders/orders.dart';
import 'package:mai_jo/packages/views/settings/settings.dart';
import 'package:mai_jo/services/constant/paths_svg.dart';

class BootomNavigationBar extends StatelessWidget {
  const BootomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BottomAppBar(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            child: SizedBox(
              width: double.infinity,
              height: 58.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: PathSvg.favorite,
                        iconSize: 20.w,
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            FavoritesPage.routename,
                          );
                        },
                      ),
                      const Text("Favorites")
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: PathSvg.order,
                        iconSize: 20.w,
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            OrdersPage.routename,
                          );
                        },
                      ),
                      const Text("Orders")
                    ],
                  ),
                  const SizedBox(width: 50),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: PathSvg.setting,
                        iconSize: 20.w,
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            SettingsPage.routename,
                          );
                        },
                      ),
                      Center(child: const Text("Settings"))
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: PathSvg.more,
                        iconSize: 20.w,
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            MorePage.routename,
                          );
                        },
                      ),
                      const Text("More")
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 12.h,
          left: 0,
          right: 0,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: 59,
              height: 61,
              child: FloatingActionButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.5),
                ),
                child: PathSvg.home,
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    HomePageScreen.routename,
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
