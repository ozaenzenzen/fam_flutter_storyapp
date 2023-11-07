import 'package:fam_flutter_storyapp/presentation/widget/app_appbar_widget.dart';
import 'package:fam_flutter_storyapp/support/app_localization.dart';
import 'package:fam_flutter_storyapp/utils/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

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
      appBar: AppAppBarWidget(
        title: AppLocalizations.of(context)!.textSettings,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 16.h,
          horizontal: 16.h,
        ),
        child: Column(
          children: [
            DropdownButtonHideUnderline(
              child: DropdownButton(
                hint: Text(
                  AppLocalizations.of(context)!.textLanguage,
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                  ),
                ),
                icon: const Icon(Icons.flag),
                items: AppLocalizations.supportedLocales.map((Locale locale) {
                  final flag = Localization.getFlag(locale.languageCode);
                  return DropdownMenuItem(
                    value: locale,
                    child: Center(
                      child: Text(
                        flag,
                        style: GoogleFonts.inter(),
                      ),
                    ),
                    onTap: () {
                      final provider = Provider.of<LocalizationProvider>(context, listen: false);
                      provider.setLocale(locale);
                    },
                  );
                }).toList(),
                onChanged: (_) {},
              ),
            ),
            // ListTile(
            //   title: Text(
            //     // 'Bahasa',
            //     AppLocalizations.of(context)!.textLanguage,
            //     style: GoogleFonts.inter(
            //       fontSize: 16.sp,
            //     ),
            //   ),
            //   // trailing: Switch.adaptive(
            //   //   activeColor: AppColor.primary,
            //   //   value: isChange,
            //   //   onChanged: (value) async {
            //   //     isChange = value;
            //   //     if (isChange) {
            //   //       final provider = Provider.of<LocalizationProvider>(context, listen: false);
            //   //       provider.setLocale(const Locale("en"));
            //   //     } else {
            //   //       final provider = Provider.of<LocalizationProvider>(context, listen: false);
            //   //       provider.setLocale(const Locale("id"));
            //   //     }
            //   //   },
            //   // ),
            //   // trailing: ChangeNotifierProvider<LocalizationProvider>(
            //   trailing: Builder(
            //     // create: (context) => LocalizationProvider(),
            //     builder: (context) {
            //       final providerLocale = Provider.of<LocalizationProvider>(context, listen: false);
            //       debugPrint('providerLocale ${providerLocale.locale.languageCode}');
            //       // if (providerLocale.locale.languageCode == "en") {
            //       //   isChange = true;
            //       // } else {
            //       //   isChange = false;
            //       // }
            //       return Switch.adaptive(
            //         activeColor: AppColor.primary,
            //         value: isChange,
            //         onChanged: (value) async {
            //           isChange = value;
            //           if (isChange) {
            //             final provider = Provider.of<LocalizationProvider>(context, listen: false);
            //             provider.setLocale(const Locale("en"));
            //           } else {
            //             final provider = Provider.of<LocalizationProvider>(context, listen: false);
            //             provider.setLocale(const Locale("id"));
            //           }
            //         },
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
