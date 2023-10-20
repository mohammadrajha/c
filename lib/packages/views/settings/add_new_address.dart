import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mai_jo/packages/component/custom_text_filed.dart';
import 'package:mai_jo/packages/component/text.dart';
import 'package:mai_jo/services/constant/paths_svg.dart';
import 'package:mai_jo/services/theme/app_colors.dart';

class AddNewAddress extends StatefulWidget {
  static const String routename = 'AddNewAddress';
  const AddNewAddress({super.key});

  @override
  State<AddNewAddress> createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  final _streetNameController = TextEditingController();
  final _BuilderNoController = TextEditingController();
  final Set<Marker> _markers = {};
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  bool _isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 68.h, left: 20.w),
            child: Row(
              children: [
                PathSvg.iconBackgriund,
                SizedBox(
                  width: 10.w,
                ),
                buildText('Add new Address', 16, AppColors.fontcolor),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 24.h),
            child: Container(
              color: Colors.amber,
              width: double.infinity,
              height: 164.h,
              child: GoogleMap(
                mapType: MapType.normal,
                zoomControlsEnabled: false,
                initialCameraPosition: CameraPosition(
                  target: LatLng(37.42796133580664, -122.085749655962),
                  zoom: 14.4746,
                ),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                  setState(() {
                    _isLoading = false;
                  });
                },
                markers: _markers,
              ),
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          CustomTextField(
            controller: _streetNameController,
            label: 'Street Name',
            color: AppColors.kPrimaryLight,
            widthButton: 20.w,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: CustomTextField(
                  controller: _BuilderNoController,
                  label: 'Building No.',
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
