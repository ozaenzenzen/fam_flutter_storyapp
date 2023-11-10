import 'package:fam_flutter_storyapp/env.dart';
import 'package:fam_flutter_storyapp/support/app_connectivity_service.dart';
import 'package:fam_flutter_storyapp/support/app_info.dart';
import 'package:fam_flutter_storyapp/support/app_location_service.dart';

class InitConfig {
  static Future<void> initialization() async {
    AppInfo.appInfoInit();
    AppConnectivityService.init();
    EnvironmentConfig.customBaseUrl = "https://story-api.dicoding.dev/v1";
    await AppLocationService.permissionHandlerLocation();
  }
}
