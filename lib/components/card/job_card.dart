import 'package:flutter/material.dart';
import 'package:job_tracker/styles/app_colors.dart';
import 'package:job_tracker/styles/app_sizes.dart';
import 'package:job_tracker/styles/text_styles.dart';

class JobCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String date;
  final String status;
  const JobCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.colorWhite,
        borderRadius: BorderRadius.circular(AppSizes.s10),
        border: Border.all(
          color: AppColors.colorBorder,
        ),
      ),
      child: ListTile(
        trailing: Container(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
          decoration: BoxDecoration(
            color: getStatus(status).withOpacity(0.8),
            borderRadius: BorderRadius.circular(AppSizes.s5),
          ),
          child: Text(
            status,
            style: TextStyles.regularInterFont(
                fontSize: 10, color: AppColors.colorWhite),
          ),
        ),
        title: Text(
          title,
          style: TextStyles.boldInterFont(
              fontSize: 20, color: AppColors.colorPrimaryDark),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              subtitle,
              style: TextStyles.mediumInterFont(
                  fontSize: 16, color: AppColors.colorPrimaryDark),
            ),
            Text(
              date,
              style: TextStyles.mediumInterFont(
                  fontSize: 16, color: AppColors.colorPrimaryDark),
            ),
          ],
        ),
      ),
    );
  }

  getStatus(String status) {
    switch (status) {
      case "In Process":
        return AppColors.colorStatusInProcess;
      case "Rejected":
        return AppColors.colorStatusRejected;
      case "Accepted":
        return AppColors.colorStatusAccepted;
      case "Interview":
        return AppColors.colorStatusInterview;
      default:
        return AppColors.colorPrimary;
    }
  }
}
