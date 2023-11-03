import 'package:fam_flutter_storyapp/support/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

enum AppScreenLoadingWidgetStyle { withBackground, noBackground }

class AppScreenLoadingWidget extends StatelessWidget {
  final AppScreenLoadingWidgetStyle appScreenLoadingWidgetStyle;

  const AppScreenLoadingWidget({
    super.key,
    // this.appScreenLoadingWidgetStyle = AppScreenLoadingWidgetStyle.noBackground,
    this.appScreenLoadingWidgetStyle = AppScreenLoadingWidgetStyle.withBackground,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.black54,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (appScreenLoadingWidgetStyle == AppScreenLoadingWidgetStyle.withBackground)
            Container(
              padding: EdgeInsets.all(20.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 50.h,
                    width: 50.h,
                    child: const CircularProgressIndicator(
                      color: AppColor.primary,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "Loading... Please wait",
                    style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          if (appScreenLoadingWidgetStyle == AppScreenLoadingWidgetStyle.noBackground)
            Column(
              children: [
                SizedBox(
                  height: 50.h,
                  width: 50.h,
                  child: const CircularProgressIndicator(
                    color: AppColor.primary,
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  "Loading... Please wait",
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          // SizedBox(
          //   height: 60.h,
          //   width: 60.h,
          //   child: const CircularProgressIndicator(
          //     color: AppColor.primary,
          //   ),
          // ),
          // SizedBox(height: 16.h),
          // Text(
          //   "Loading... Please wait",
          //   style: GoogleFonts.inter(
          //     color: Colors.white,
          //     fontSize: 18.sp,
          //     fontWeight: FontWeight.w500,
          //   ),
          // ),
        ],
      ),
    );
  }
}
