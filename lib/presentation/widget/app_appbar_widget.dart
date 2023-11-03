import 'package:fam_flutter_storyapp/support/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppAppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final Function()? onBack;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;

  const AppAppBarWidget({
    super.key,
    required this.title,
    this.onBack,
    this.actions,
    this.bottom,
  });

  @override
  State<AppAppBarWidget> createState() => _AppAppBarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppAppBarWidgetState extends State<AppAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.primary,
      elevation: 10,
      shadowColor: const Color(0xff101828),
      centerTitle: true,
      leading: InkWell(
        onTap: widget.onBack ??
            () {
              Navigator.pop(context);
            },
        child: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      title: Text(
        widget.title,
        style: GoogleFonts.inter(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 18.sp,
        ),
      ),
      actions: widget.actions,
      bottom: widget.bottom,
    );
  }
}
