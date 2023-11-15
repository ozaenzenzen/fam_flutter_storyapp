import 'package:fam_flutter_storyapp/support/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class {{appBarWidgetName.pascalCase()}} extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final Function()? onBack;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final bool? automaticallyImplyLeading;

  const {{appBarWidgetName.pascalCase()}}({
    super.key,
    required this.title,
    this.onBack,
    this.actions,
    this.bottom,
    this.automaticallyImplyLeading,
  });

  @override
  State<{{appBarWidgetName.pascalCase()}}> createState() => _{{appBarWidgetName.pascalCase()}}State();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _{{appBarWidgetName.pascalCase()}}State extends State<{{appBarWidgetName.pascalCase()}}> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      backgroundColor: AppColor.primary,
      elevation: 10,
      shadowColor: const Color(0xff101828),
      centerTitle: true,
      automaticallyImplyLeading: widget.automaticallyImplyLeading ?? true,
      leading: widget.onBack != null
          ? InkWell(
              onTap: widget.onBack,
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            )
          : null,
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
