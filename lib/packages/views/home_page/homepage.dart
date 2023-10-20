import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mai_jo/packages/component/navigation_bar.dart';
import 'package:mai_jo/packages/views/home_page/component/build_frequently_used_section.dart';
import 'package:mai_jo/packages/views/home_page/component/build_header_section.dart';
import 'package:mai_jo/packages/views/home_page/component/build_news_section.dart';
import 'package:mai_jo/packages/views/home_page/component/nearby_station/nearbystationhome.dart';

class HomePageScreen extends StatelessWidget {
  static const String routename = 'HomePageScreen';
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const BuildHeaderSection(),
            const BuildFrequentlyUsedSection(),
            BuildNewsAndCommunitySection(),
            Padding(
              padding: EdgeInsets.only(bottom: 88.h),
              child: const NearbyStationHome(),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const BootomNavigationBar(),
    );
  }
}
