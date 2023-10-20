import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mai_jo/packages/component/custom_link_text.dart';
import 'package:mai_jo/packages/component/navigation_bar.dart';
import 'package:mai_jo/packages/component/text.dart';
import 'package:mai_jo/packages/views/settings/add_new_address.dart';
import 'package:mai_jo/packages/views/settings/component/custom_list_location.dart';
import 'package:mai_jo/packages/views/settings/component/custom_list_tile.dart';
import 'package:mai_jo/services/constant/paths_svg.dart';
import 'package:mai_jo/services/theme/app_colors.dart';

class SettingsPage extends StatelessWidget {
  static const String routename = 'SettingsPage';
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 68.h, left: 20.w),
            child: Row(
              children: [
                PathSvg.iconBackgriund,
                SizedBox(
                  width: 10.w,
                ),
                buildText('Settings', 16, AppColors.fontcolor),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20.w,
              top: 27.h,
            ),
            child: buildText('Personal data', 16, AppColors.fontLight),
          ),
          CustomListTile(
            title: 'Change Your Name',
            onTap: () {},
            onBackButtonPressed: () {},
            backgroundColorIcon: AppColors.laghtColorGrayBackground,
          ),
          CustomListTile(
            title: 'Change Email Address',
            onTap: () {},
            onBackButtonPressed: () {},
            backgroundColorIcon: AppColors.laghtColorGrayBackground,
          ),
          CustomListTile(
            title: 'Change Phone number',
            onTap: () {},
            onBackButtonPressed: () {},
            backgroundColorIcon: AppColors.laghtColorGrayBackground,
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.h, left: 20.w),
            child: buildText('Locations details', 16, AppColors.fontcolorGray),
          ),
          CustomListLocationList(
            title: "Tabarbour, Amman",
            onTap: () {
              print("Custom ListTile was tapped!");
            },
            leadingIcon: Icons.star,
            trailingIcon: Icons.arrow_forward_ios,
            onBackButtonPressed: () {},
            backgroundColorIcon: AppColors.kPrimaryLight,
            backgroundColorIcontwo: AppColors.redLight,
          ),
          CustomListLocationList(
            title: "Abu Nsair, Amman",
            onTap: () {
              print("Custom ListTile was tapped!");
            },
            leadingIcon: Icons.star,
            trailingIcon: Icons.arrow_forward_ios,
            onBackButtonPressed: () {},
            backgroundColorIcon: AppColors.kPrimaryLight,
            backgroundColorIcontwo: AppColors.redLight,
          ),
          CustomListLocationList(
            title: "Q. Rania street, Amman",
            onTap: () {
              print("Custom ListTile was tapped!");
            },
            leadingIcon: Icons.star,
            trailingIcon: Icons.arrow_forward_ios,
            onBackButtonPressed: () {},
            backgroundColorIcon: AppColors.kPrimaryLight,
            backgroundColorIcontwo: AppColors.redLight,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 16.5.h),
            child: Row(
              children: [
                Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: PathSvg.pluseBlue),
                customLinkText('Add new location', 14, (() {})),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(AddNewAddress.routename);
                  },
                  child: Container(
                    width: 28.w,
                    height: 28.h,
                    decoration: BoxDecoration(
                      color: AppColors.laghtColorGrayBackground,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: PathSvg.pluseBluesmall,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const BootomNavigationBar(),
    );
  }
}
