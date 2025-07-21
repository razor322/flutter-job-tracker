import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_tracker/resources/constants/app_constants.dart';
import 'package:job_tracker/routes/app_routes.dart';
import 'package:job_tracker/styles/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Future.delayed(AppConstants.SPLASH_DURATION);
    Future.delayed(AppConstants.SPLASH_DURATION, () {
      Get.offNamed(AppRoutes.main);
    });
    return Scaffold(
      backgroundColor: AppColors.colorBackground,
      body: Center(
        child: Text("Job Tracker",
            style: Theme.of(context).textTheme.headlineLarge),
      ),
    );
  }
}
