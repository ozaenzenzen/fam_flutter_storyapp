import 'package:fam_flutter_storyapp/env.dart';
import 'package:fam_flutter_storyapp/init_config.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() async {
  EnvironmentConfig.flavor = Flavor.staging;
  WidgetsFlutterBinding.ensureInitialized();
  await InitConfig.initialization();
  runApp(const MyApp());
}