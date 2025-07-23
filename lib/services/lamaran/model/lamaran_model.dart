class LamaranModel {
  int? id;
  String namaPerusahaan;
  String posisi;
  String status;
  DateTime tanggalMelamar;
  String tahap;
  DateTime? jadwalInterview;
  String? catatan;

  LamaranModel({
    this.id,
    required this.namaPerusahaan,
    required this.posisi,
    required this.status,
    required this.tanggalMelamar,
    required this.tahap,
    this.jadwalInterview,
    this.catatan,
  });
}
