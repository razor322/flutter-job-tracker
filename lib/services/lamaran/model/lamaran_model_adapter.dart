import 'package:hive/hive.dart';
import 'package:job_tracker/services/lamaran/model/lamaran_model.dart';

class LamaranModelAdapter extends TypeAdapter<LamaranModel> {
  @override
  final int typeId = 0;

  @override
  LamaranModel read(BinaryReader reader) {
    return LamaranModel(
      id: reader.read(),
      namaPerusahaan: reader.read(),
      posisi: reader.read(),
      status: reader.read(),
      tanggalMelamar: reader.read(),
      tahap: reader.read(),
      jadwalInterview: reader.read(),
      catatan: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, LamaranModel obj) {
    writer.write(obj.id);
    writer.write(obj.namaPerusahaan);
    writer.write(obj.posisi);
    writer.write(obj.status);
    writer.write(obj.tanggalMelamar);
    writer.write(obj.tahap);
    writer.write(obj.jadwalInterview);
    writer.write(obj.catatan);
  }
}
