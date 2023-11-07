import 'package:fam_flutter_storyapp/presentation/widget/app_appbar_widget.dart';
import 'package:fam_flutter_storyapp/support/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isChange = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBarWidget(
        title: "Settings",
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 16.h,
          horizontal: 16.h,
        ),
        child: Column(
          children: [
            ListTile(
              title: const Text('Bahasa'),
              trailing: Switch.adaptive(
                activeColor: AppColor.primary,
                value: isChange,
                onChanged: (value) async {
                  setState(() {
                    isChange = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
