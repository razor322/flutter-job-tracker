// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_tracker/components/card/job_card.dart';
import 'package:job_tracker/controllers/lamaran/lamaran_controller.dart';
import 'package:job_tracker/services/lamaran/model/lamaran_model.dart';
import 'package:job_tracker/styles/app_colors.dart';
import 'package:job_tracker/styles/app_sizes.dart';
import 'package:job_tracker/styles/text_styles.dart';
import 'package:job_tracker/utils/extensions/double_extension.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final controller = Get.put(LamaranController());
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
              GestureDetector(
                onTap: () {
                  Get.defaultDialog(
                    title: "Add New Application",
                    content: Column(
                      children: [
                        TextField(
                          controller: controller.namaPerusahaan,
                          decoration:
                              InputDecoration(labelText: "Company Name"),
                        ),
                        TextField(
                          controller: controller.posisi,
                          decoration: InputDecoration(labelText: "Position"),
                        ),
                        TextField(
                          controller: controller.status,
                          decoration: InputDecoration(labelText: "Status"),
                        ),
                        Obx(
                          () => Wrap(
                            spacing: AppSizes.s4,
                            children: controller.statusList.map((status) {
                              return ChoiceChip(
                                tooltip: status,
                                label: Text(status),
                                selectedColor: getStatus(status),
                                backgroundColor: AppColors.colorWhite,
                                selected:
                                    controller.selectedStatus.value == status,
                                onSelected: (selected) {
                                  controller.selectedStatus.value = status;
                                  controller.status.text = status;
                                },
                              );
                            }).toList(),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: controller.tglMelamar,
                                decoration: InputDecoration(
                                    labelText: "Date of Application"),
                              ),
                            ),
                            AppSizes.s10.toHorizontalSpace(),
                            IconButton(
                              onPressed: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2100),
                                ).then((selectedDate) {
                                  if (selectedDate != null) {
                                    controller.tglMelamar.text =
                                        selectedDate.toLocal().toString();
                                  }
                                });
                              },
                              icon: Icon(Icons.calendar_today),
                            )
                          ],
                        ),
                        TextField(
                          controller: controller.tahapan,
                          decoration: InputDecoration(
                              labelText: "Stage of Application"),
                        ),
                      ],
                    ),
                    onConfirm: () {
                      final lamaran = LamaranModel(
                        namaPerusahaan: controller.namaPerusahaan.text,
                        posisi: controller.posisi.text,
                        status: controller.status.text,
                        tanggalMelamar:
                            DateTime.parse(controller.tglMelamar.text),
                        tahap: controller.tahapan.text,
                      );
                      controller.addLamaran(lamaran);
                      Get.back();
                    },
                  );
                },
                child: Container(
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
              ),
              AppSizes.s16.toVerticalSpace(),
              Obx(
                () {
                  if (controller.lamaranList.isEmpty) {
                    return Center(
                      child: Text(
                        "No applications found",
                        style: TextStyles.mediumInterFont(
                            fontSize: 16, color: AppColors.colorPrimaryDark),
                      ),
                    );
                  }

                  return Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          final lamaran = controller.lamaranList[index];
                          return GestureDetector(
                            onTap: () {
                              Get.defaultDialog(
                                title: "Application Details",
                                content: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Company: ${lamaran.namaPerusahaan}"),
                                    Text("Position: ${lamaran.posisi}"),
                                    Text("Status: ${lamaran.status}"),
                                    Text(
                                        "Date of Application: ${lamaran.tanggalMelamar.toLocal().toString().split(' ')[0]}"),
                                    Text("Stage: ${lamaran.tahap}"),
                                    if (lamaran.jadwalInterview != null)
                                      Text(
                                          "Interview Schedule: ${lamaran.jadwalInterview!.toLocal().toString().split(' ')[0]}"),
                                    if (lamaran.catatan != null)
                                      Text("Notes: ${lamaran.catatan}"),
                                  ],
                                ),
                                confirm: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        controller.updateLamaran(
                                            index, lamaran);
                                        Get.back();
                                      },
                                      child: Text("Update"),
                                    ),
                                    AppSizes.s10.toHorizontalSpace(),
                                    ElevatedButton(
                                      onPressed: () {
                                        controller.deleteLamaran(index);
                                        Get.back();
                                      },
                                      child: Text("Delete"),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: JobCard(
                              title: lamaran.namaPerusahaan,
                              subtitle: lamaran.posisi,
                              date: lamaran.tanggalMelamar
                                  .toLocal()
                                  .toString()
                                  .split(' ')[0],
                              status: lamaran.status,
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            AppSizes.s16.toVerticalSpace(),
                        itemCount: controller.lamaranList.length),
                  );
                },
              )
            ]),
          ),
        ));
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
