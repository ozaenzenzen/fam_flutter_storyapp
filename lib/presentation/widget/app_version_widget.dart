import 'package:fam_flutter_storyapp/support/app_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppVersionWidget extends StatefulWidget {
  const AppVersionWidget({super.key});

  @override
  State<AppVersionWidget> createState() => _AppVersionWidgetState();
}

class _AppVersionWidgetState extends State<AppVersionWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: FutureBuilder(
          future: AppInfo.showAppVersion(),
          builder: (context, snapshot) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: 10.h,
              ),
              child: Text(
                "Story App Version ${snapshot.data}",
                style: GoogleFonts.inter(
                  fontSize: 10.sp,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
