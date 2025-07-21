import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_tracker/routes/app_routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'job tracker',
      initialRoute: AppRoutes.splash,
      debugShowCheckedModeBanner: false,
      locale: const Locale('en', 'US'),
      supportedLocales: const [Locale('id', 'ID'), Locale('en', 'US')],
      getPages: AppRoutes.routes,
      theme: ThemeData(fontFamily: 'Inter'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
