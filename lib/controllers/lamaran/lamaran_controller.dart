import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_tracker/di/application_module.dart';
import 'package:job_tracker/services/lamaran/job_repository.dart';
import 'package:job_tracker/services/lamaran/model/lamaran_model.dart';

class LamaranController extends GetxController {
  final LamaranRepository lamaranRepository = locator();

  final lamaranList = <LamaranModel>[].obs;
  final statusList = ["In Process", "Interview", "Accepted", "Rejected"];
  var selectedStatus = "".obs;

  TextEditingController namaPerusahaan = TextEditingController();
  TextEditingController posisi = TextEditingController();
  TextEditingController status = TextEditingController();
  TextEditingController tglMelamar = TextEditingController();
  TextEditingController tahapan = TextEditingController();
  TextEditingController catatan = TextEditingController();
  TextEditingController jadwalInterview = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchLamaran();
  }

  void fetchLamaran() {
    lamaranList.value = lamaranRepository.getLamaran();
  }

  Future<void> addLamaran(LamaranModel lamaran) async {
    if (namaPerusahaan.text.isEmpty ||
        posisi.text.isEmpty ||
        status.text.isEmpty ||
        tglMelamar.text.isEmpty ||
        tahapan.text.isEmpty) {
      Get.snackbar("Error", "Please fill all fields");
      return;
    }

    await lamaranRepository.addLamaran(lamaran);
    fetchLamaran();
  }

  Future<void> deleteLamaran(int index) async {
    await lamaranRepository.deleteLamaran(index);
    fetchLamaran();
  }

  Future<void> updateLamaran(int index, LamaranModel model) async {
    await lamaranRepository.updateLamaran(index, model);
    fetchLamaran();
  }
}
