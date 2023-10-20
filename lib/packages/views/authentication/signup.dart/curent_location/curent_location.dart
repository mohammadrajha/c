import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mai_jo/services/constant/path_images.dart';
import 'package:mai_jo/services/theme/app_colors.dart';
import '../../../../component/custom_text_filed.dart';
import '../../../../component/text.dart';
import '../../../../component/title.dart';
import '../../../home_page/homepage.dart';
import '../../../welcome_page/component/custom_build_button.dart';

class CurentLocation extends StatefulWidget {
  static const String routename = 'CurentLocation';
  const CurentLocation({super.key});

  @override
  State<CurentLocation> createState() => _CurentLocationState();
}

class _CurentLocationState extends State<CurentLocation> {
  final _locationController = TextEditingController();
  bool _isLoading = true;
  LatLng? _selectedCoordinates;
  final Set<Marker> _markers = {};
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    Position position = await _determinePosition();
    _updateMapToPosition(LatLng(position.latitude, position.longitude));
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    return position;
  }

  void _updateMapToPosition(LatLng position) {
    setState(() {
      _selectedCoordinates = position;
      _markers.clear();
      _markers.add(Marker(
        markerId: MarkerId("selected_location"),
        position: position,
        infoWindow: InfoWindow(title: "Selected Location"),
      ));
    });

    _controller.future.then((controller) {
      controller.animateCamera(CameraUpdate.newLatLng(position));
    });
  }

  Future<LatLng?> _getCoordinatesFromAddress(String address) async {
    try {
      List<Location> locations = await locationFromAddress(address);
      if (locations.isNotEmpty) {
        Location location = locations.first;
        return LatLng(location.latitude, location.longitude);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  void _searchAndNavigate() async {
    LatLng? coordinates =
        await _getCoordinatesFromAddress(_locationController.text);
    if (coordinates != null) {
      _updateMapToPosition(coordinates);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Couldn't find the location")),
      );
    }
  }

  void _showSelectedLocationDetails(
      LatLng coordinates, BuildContext context) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
        coordinates.latitude, coordinates.longitude);
    Placemark placemark = placemarks[0];
    String city = placemark.locality ?? "Unknown";
    String street = placemark.thoroughfare ?? "Unknown";

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Selected Location Details'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('City: $city'),
              SizedBox(height: 8.h),
              Text('Street: $street'),
            ],
          ),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actions: [
            TextButton(
              child: const Text('Edit'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Accseept'),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, HomePageScreen.routename, (route) => false);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  height: 142.h,
                  color: AppColors.bgWhite,
                  child: Padding(
                    padding: EdgeInsets.only(top: 68.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildTitle('Where to delivery!'),
                        buildText(
                            'Please choose your delivery default location',
                            14,
                            AppColors.fontcolor),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Stack(
                  children: [
                    GoogleMap(
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
                    Positioned(
                      right: 10.w,
                      bottom: 10.h,
                      child: FloatingActionButton(
                        child: const Icon(Icons.my_location),
                        onPressed: () async {
                          _locationController.clear();
                          _getCurrentLocation();
                        },
                      ),
                    ),
                    if (_isLoading)
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  height: 205.h,
                  color: AppColors.bgWhite,
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(top: 30.h, left: 20.w, right: 20.w),
                        child: CustomTextField(
                          widthButton: 0.0,
                          controller: _locationController,
                          label: 'Search for location',
                          isPassword: false,
                          color: AppColors.kPrimaryLight,
                          imageIcon: Image.asset(PathImages.locationIcon),
                          onSubmitted: (text) {
                            _searchAndNavigate();
                          },
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: _searchAndNavigate,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 21.h,
                      ),
                      CustomBuildButton(
                        borderColor: AppColors.kPrimaryColor,
                        buttonColor: AppColors.kPrimaryColor,
                        fontColor: AppColors.bgWhite,
                        onPressed: () {
                          if (_selectedCoordinates != null) {
                            _showSelectedLocationDetails(
                                _selectedCoordinates!, context);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("Please select a location first")),
                            );
                          }
                        },
                        text: 'Submit',
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
