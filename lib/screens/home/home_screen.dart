// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:job_tracker/components/card/job_card.dart';
import 'package:job_tracker/styles/app_colors.dart';
import 'package:job_tracker/styles/app_sizes.dart';
import 'package:job_tracker/styles/text_styles.dart';
import 'package:job_tracker/utils/extensions/double_extension.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final List<Map<String, String>> jobList = [
    {
      "title": "Google",
      "subtitle": "Software Engineer",
      "date": "10 Apr 2025",
      "status": "In Process",
    },
    {
      "title": "Meta",
      "subtitle": "Backend Developer",
      "date": "15 Apr 2025",
      "status": "Interview",
    },
    {
      "title": "Amazon",
      "subtitle": "Frontend Developer",
      "date": "20 Apr 2025",
      "status": "Rejected",
    },
    {
      "title": "Netflix",
      "subtitle": "Mobile Developer",
      "date": "22 Apr 2025",
      "status": "Accepted",
    },
    {
      "title": "Microsoft",
      "subtitle": "Cloud Engineer",
      "date": "25 Apr 2025",
      "status": "In Process",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.colorBackground,
        body: Padding(
          padding: AppSizes.generalPadding,
          child: SafeArea(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Center(
                child: Text(
                  "Job Applications",
                  style: TextStyles.boldInterFont(
                      fontSize: 24, color: AppColors.colorPrimaryDark),
                ),
              ),
              AppSizes.s16.toVerticalSpace(),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.colorAccent,
                  borderRadius: BorderRadius.circular(AppSizes.s16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add,
                        size: 25, color: AppColors.colorPrimaryDark),
                    AppSizes.s10.toHorizontalSpace(),
                    Text("Add Application",
                        style: TextStyles.boldInterFont(
                            fontSize: 20, color: AppColors.colorPrimaryDark)),
                  ],
                ),
              ),
              AppSizes.s16.toVerticalSpace(),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      final job = jobList[index];
                      return JobCard(
                        title: job['title']!,
                        subtitle: job['subtitle']!,
                        date: job['date']!,
                        status: job['status']!,
                      );
                    },
                    separatorBuilder: (context, index) =>
                        AppSizes.s16.toVerticalSpace(),
                    itemCount: jobList.length),
              )
            ]),
          ),
        ));
  }
}
