import 'dart:async';
import 'dart:typed_data';

import 'package:fam_flutter_storyapp/presentation/widget/app_appbar_widget.dart';
import 'package:fam_flutter_storyapp/support/app_bottomsheet_action.dart';
import 'package:fam_flutter_storyapp/support/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:screenshot/screenshot.dart';

class {{mapsPageName.pascalCase()}} extends StatefulWidget {
  final Function()? onBack;
  final Function(
    LatLng latLng,
    Placemark placemarkMap,
    String alamat,
    Uint8List? screenshotMap,
  )? actionCallback;

  const {{mapsPageName.pascalCase()}}({
    super.key,
    this.onBack,
    this.actionCallback,
  });

  @override
  State<{{mapsPageName.pascalCase()}}> createState() => {{mapsPageName.pascalCase()}}State();
}

class {{mapsPageName.pascalCase()}}State extends State<{{mapsPageName.pascalCase()}}> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-6.3861878, 106.8259726),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(-6.3861878, 106.8259726),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414,
  );

  Set<Marker> markers = <Marker>{};

  late LatLng _currentLocation;

  final ScreenshotController _screenshotController = ScreenshotController();

  @override
  void initState() {
    super.initState();
    debugPrint('SCREEN MAPS');
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        _currentLocation = LatLng(position.latitude, position.longitude);
        _addMarker(_currentLocation);
      });
    } catch (e) {
      debugPrint('Error getting current location: $e');
    }
  }

  void _addMarker(LatLng latLng) {
    final MarkerId markerId = MarkerId(latLng.toString());
    final Marker newMarker = Marker(
      markerId: markerId,
      position: latLng,
      // draggable: true,
      // onDragEnd: (LatLng newPosition) {
      //   print('Marker moved to: ${newPosition.latitude}, ${newPosition.longitude}');
      // },
    );

    setState(() {
      markers.clear();
      markers.add(newMarker);
    });
  }

  _actionAfterPutMarker(Placemark placemark, LatLng latLng) {
    AppBottomSheetAction().showBottomSheetV2(
      title: 'Atur Pin Lokasi',
      context: context,
      withStrip: true,
      radius: 20.h,
      content: StatefulBuilder(
        builder: (BuildContext context, Function setState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.location_on,
                    size: 20.h,
                    color: AppColor.primary,
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '${placemark.name}',
                          style: GoogleFonts.mukta(
                            color: const Color(0xff121419),
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                          ),
                        ),
                        Text(
                          '${placemark.street}, ${placemark.subLocality}, ${placemark.locality}, ${placemark.subAdministrativeArea}, ${placemark.administrativeArea}, ${placemark.country}, ${placemark.postalCode}',
                          style: GoogleFonts.mukta(
                            color: const Color(0xff121419),
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                          ),
                        ),
                        // Text(
                        //   '${placemark.toJson()}',
                        //   style: GoogleFonts.mukta(
                        //     color: const Color(0xff121419),
                        //     fontWeight: FontWeight.w400,
                        //     fontSize: 14.sp,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              InkWell(
                onTap: () async {
                  // Uint8List? dataScreenshot = await takeMapScreenshot();
                  Uint8List? dataScreenshot = await _takeMapScreenshotV2();
                  if (dataScreenshot != null) {
                    String alamat =
                        '${placemark.street}, ${placemark.subLocality}, ${placemark.locality}, ${placemark.subAdministrativeArea}, ${placemark.administrativeArea}, ${placemark.country}, ${placemark.postalCode}';
                    widget.actionCallback?.call(latLng, placemark, alamat, dataScreenshot);
                    debugPrint('alamat $alamat');
                  } else {
                    //
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 48.h,
                  decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    'Pilih Alamat',
                    style: GoogleFonts.mukta(
                      color: AppColor.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
            ],
          );
        },
      ),
    );
  }

  Future<void> _getAddressFromCoordinates(LatLng latLng) async {
    try {
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(
        CameraUpdate.newLatLng(latLng),
      );

      List<Placemark> placemarks = await placemarkFromCoordinates(
        latLng.latitude,
        latLng.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks.first;
        // String address = '${placemark.name}, ${placemark.locality}, ${placemark.country}';
        // String address = '${placemark.street}, ${placemark.subLocality}, ${placemark.locality}, ${placemark.subAdministrativeArea}, ${placemark.administrativeArea}, ${placemark.country}, ${placemark.postalCode}';
        // showAddressDialog(address);
        // Uint8List? dataScreenshot = await _takeMapScreenshot();

        _actionAfterPutMarker(placemark, latLng);
        debugPrint('${placemark.toJson()}');
        // Uint8List? dataScreenshot = await _takeMapScreenshotV2();
        // widget.actionCallback?.call(placemark, address, dataScreenshot);
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  Future<Uint8List?> takeMapScreenshot() async {
    try {
      Uint8List? dataScreenshot = await _screenshotController.capture();
      if (dataScreenshot != null) {
        return dataScreenshot;
      } else {
        debugPrint('Error taking the screenshot');
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  // DialogsUtils _dialogUtils = DialogsUtils();

  Future<Uint8List?> _takeMapScreenshotV2() async {
    // _dialogUtils.showLoading();
    try {
      Uint8List? imageBytes;
      GoogleMapController controller = await _controller.future;
      // await Future<void>.delayed(const Duration(milliseconds: 500));
      // Future<void>.delayed(const Duration(milliseconds: 1000), () async {
      // });
      imageBytes = await controller.takeSnapshot();
      // _dialogUtils.hideLoading();
      return imageBytes;
    } catch (e) {
      // _dialogUtils.hideLoading();
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        widget.onBack?.call();
        return true;
      },
      child: Screenshot(
        controller: _screenshotController,
        child: Scaffold(
          appBar: AppAppBarWidget(
            title: 'Maps',
            onBack: () {
              widget.onBack?.call();
            },
          ),
          body: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            markers: markers,
            onTap: (LatLng latLang) async {
              debugPrint('latLang.latitude ${latLang.latitude}');
              debugPrint('latLang.longitude ${latLang.longitude}');
              _addMarker(latLang);
              _getAddressFromCoordinates(latLang);
            },
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          floatingActionButton: FloatingActionButton.extended(
            // onPressed: goToTheLake,
            onPressed: _updateMarkerToCurrentLocation,
            label: const Text('My Location'),
            icon: const Icon(Icons.location_on),
          ),
        ),
      ),
    );
  }

  Future<void> goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  void _updateMarkerToCurrentLocation() async {
    final GoogleMapController controller = await _controller.future;
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        _currentLocation = LatLng(
          position.latitude,
          position.longitude,
        );
        _addMarker(_currentLocation);
        _getAddressFromCoordinates(_currentLocation);
        controller.animateCamera(
          CameraUpdate.newLatLng(_currentLocation),
        );
      });
    } catch (e) {
      debugPrint('Error updating current location: $e');
    }
  }
}
