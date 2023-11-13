import 'package:fam_flutter_storyapp/presentation/widget/animation/loader_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:math' as math;

enum AppScreenLoadingWidgetStyle { withBackground, noBackground }

class AppScreenLoadingWidget extends StatefulWidget {
  final AppScreenLoadingWidgetStyle appScreenLoadingWidgetStyle;

  const AppScreenLoadingWidget({
    super.key,
    // this.appScreenLoadingWidgetStyle = AppScreenLoadingWidgetStyle.noBackground,
    this.appScreenLoadingWidgetStyle = AppScreenLoadingWidgetStyle.withBackground,
  });

  @override
  State<AppScreenLoadingWidget> createState() => _AppScreenLoadingWidgetState();
}

class _AppScreenLoadingWidgetState extends State<AppScreenLoadingWidget> with TickerProviderStateMixin {
  late AnimationController loaderController;
  late Animation<double> loaderAnimation;

  @override
  void initState() {
    loaderController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    loaderAnimation = Tween(begin: 1.0, end: 1.4).animate(CurvedAnimation(
      parent: loaderController,
      curve: Curves.easeIn,
    ));
    loaderController.repeat(reverse: true);

    super.initState();
  }

  @override
  void dispose() {
    loaderController.dispose();
    super.dispose();
  }

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
          if (widget.appScreenLoadingWidgetStyle == AppScreenLoadingWidgetStyle.withBackground)
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
                    // child: const CircularProgressIndicator(
                    //   color: AppColor.primary,
                    // ),
                    child: AnimatedBuilder(
                      animation: loaderController,
                      builder: (context, child) {
                        return Transform.rotate(
                          angle: loaderController.status == AnimationStatus.forward ? (math.pi * 2) * loaderController.value : -(math.pi * 2) * loaderController.value,
                          child: CustomPaint(
                            foregroundPainter: LoaderAnimation(
                              radiusRatio: loaderAnimation.value,
                            ),
                            size: const Size(300, 300),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    // "Loading... Please wait",
                    AppLocalizations.of(context)!.textLoading,
                    style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          if (widget.appScreenLoadingWidgetStyle == AppScreenLoadingWidgetStyle.noBackground)
            Column(
              children: [
                SizedBox(
                  height: 50.h,
                  width: 50.h,
                  // child: const CircularProgressIndicator(
                  //   color: AppColor.primary,
                  // ),
                  child: AnimatedBuilder(
                    animation: loaderController,
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: loaderController.status == AnimationStatus.forward ? (math.pi * 2) * loaderController.value : -(math.pi * 2) * loaderController.value,
                        child: CustomPaint(
                          foregroundPainter: LoaderAnimation(
                            radiusRatio: loaderAnimation.value,
                          ),
                          size: const Size(300, 300),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  // "Loading... Please wait",
                  AppLocalizations.of(context)!.textLoading,
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
