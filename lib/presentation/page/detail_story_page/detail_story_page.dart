import 'dart:async';

import 'package:fam_flutter_storyapp/presentation/page/detail_story_page/get_detail_story_bloc/get_detail_story_bloc.dart';
import 'package:fam_flutter_storyapp/presentation/widget/app_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:skeletons/skeletons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DetailStoryPage extends StatefulWidget {
  final String idStory;

  const DetailStoryPage({
    super.key,
    required this.idStory,
  });

  @override
  State<DetailStoryPage> createState() => _DetailStoryPageState();
}

class _DetailStoryPageState extends State<DetailStoryPage> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  @override
  void initState() {
    BlocProvider.of<GetDetailStoryBloc>(context).add(ActionGetDetailStory(
      idStory: widget.idStory,
    ));
    super.initState();
  }

  Set<Marker> markers = <Marker>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBarWidget(
        // title: "Detail Story",
        title: AppLocalizations.of(context)!.textDetailStory,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.w,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              imageSection(),
              SizedBox(height: 20.h),
              titleSection(),
              SizedBox(height: 10.h),
              subtitleSection(),
              SizedBox(height: 10.h),
              mapsSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget imageSection() {
    return BlocBuilder<GetDetailStoryBloc, GetDetailStoryState>(
      builder: (context, state) {
        if (state is GetDetailStoryLoading) {
          return SkeletonLine(
            style: SkeletonLineStyle(
              height: 150.h,
              width: MediaQuery.of(context).size.width,
            ),
          );
        } else if (state is GetDetailStorySuccess) {
          return Image.network(
            "${state.getDetailStoryResponseModel.story?.photoUrl}",
            // height: 150.h,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return SizedBox(
                height: 160.h,
                child: Center(
                  child: Text(
                    "Something's wrong, please reload",
                    style: GoogleFonts.inter(),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Widget titleSection() {
    return BlocBuilder<GetDetailStoryBloc, GetDetailStoryState>(
      builder: (context, state) {
        if (state is GetDetailStoryLoading) {
          return SkeletonLine(
            style: SkeletonLineStyle(
              height: 40.h,
              width: MediaQuery.of(context).size.width,
            ),
          );
        } else if (state is GetDetailStorySuccess) {
          return Text(
            '${state.getDetailStoryResponseModel.story?.name}',
            style: GoogleFonts.inter(
              fontSize: 18.sp,
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Widget subtitleSection() {
    return BlocBuilder<GetDetailStoryBloc, GetDetailStoryState>(
      builder: (context, state) {
        if (state is GetDetailStoryLoading) {
          return SkeletonLine(
            style: SkeletonLineStyle(
              height: 40.h,
              width: MediaQuery.of(context).size.width,
            ),
          );
        } else if (state is GetDetailStorySuccess) {
          return Text(
            '${state.getDetailStoryResponseModel.story?.description}',
            style: GoogleFonts.inter(
              fontSize: 18.sp,
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Widget mapsSection() {
    return BlocBuilder<GetDetailStoryBloc, GetDetailStoryState>(
      builder: (context, state) {
        if (state is GetDetailStoryLoading) {
          return SkeletonLine(
            style: SkeletonLineStyle(
              height: 150.h,
              width: MediaQuery.of(context).size.width,
            ),
          );
        } else if (state is GetDetailStorySuccess) {
          if (state.getDetailStoryResponseModel.story!.lat == null || state.getDetailStoryResponseModel.story!.lon == null || state.placemark == null) {
            return const SizedBox();
          } else {
            final MarkerId markerId = MarkerId(LatLng(
              state.getDetailStoryResponseModel.story!.lat!,
              state.getDetailStoryResponseModel.story!.lon!,
            ).toString());
            markers.add(Marker(
              markerId: markerId,
              infoWindow: InfoWindow(
                title: 'Detail Alamat',
                snippet: '${state.placemark?.street}, ${state.placemark?.subLocality}, ${state.placemark?.locality}, ${state.placemark?.subAdministrativeArea}, ${state.placemark?.administrativeArea}, ${state.placemark?.country}, ${state.placemark?.postalCode}',
              ),
              position: LatLng(
                state.getDetailStoryResponseModel.story!.lat!,
                state.getDetailStoryResponseModel.story!.lon!,
              ),
              // draggable: true,
              // onDragEnd: (LatLng newPosition) {
              //   print('Marker moved to: ${newPosition.latitude}, ${newPosition.longitude}');
              // },
            ));
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Location: ",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  height: 400.h,
                  child: GoogleMap(
                    mapType: MapType.normal,
                    // initialCameraPosition: _kGooglePlex,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                        state.getDetailStoryResponseModel.story!.lat!,
                        state.getDetailStoryResponseModel.story!.lon!,
                      ),
                      zoom: 14.4746,
                    ),
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                    markers: markers,
                    onTap: (LatLng latLang) async {
                      debugPrint('latLang.latitude ${latLang.latitude}');
                      debugPrint('latLang.longitude ${latLang.longitude}');
                      // _addMarker(latLang);
                      // _getAddressFromCoordinates(latLang);
                    },
                  ),
                ),
              ],
            );
          }
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
