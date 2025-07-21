import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_tracker/config/flavor_config.dart';
import 'package:job_tracker/main_page.dart';

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

    Get.put<ConfigApps>(ConfigApps(flavor: Flavor.PRODUCTION));
    runApp(const MainPage());
  }, (error, stackTrace) {
    log('Error: $error');
    log('Stack trace: $stackTrace');
  });
}
