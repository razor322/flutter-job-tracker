import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:job_tracker/di/application_module.dart' as di;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:job_tracker/config/flavor_config.dart';
import 'package:job_tracker/main_page.dart';
import 'package:job_tracker/services/lamaran/model/lamaran_model.dart';
import 'package:job_tracker/services/lamaran/model/lamaran_model_adapter.dart';

class MyHttpoverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    HttpOverrides.global = MyHttpoverrides();
    await di.init();
    Get.put<ConfigApps>(ConfigApps(flavor: Flavor.PRODUCTION));
    await Hive.initFlutter();
    Hive.registerAdapter(LamaranModelAdapter());
    await Hive.openBox<LamaranModel>(ConfigApps.lamaranBoxName);
    runApp(const MainPage());
  }, (error, stackTrace) {
    log('Error: $error');
    log('Stack trace: $stackTrace');
  });
}
