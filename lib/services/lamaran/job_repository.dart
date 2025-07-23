import 'package:job_tracker/services/lamaran/job_data_source.dart';
import 'package:job_tracker/services/lamaran/model/lamaran_model.dart';

class LamaranRepository {
  final LamaranDataSource lamaranDataSource;

  LamaranRepository(this.lamaranDataSource);

  Future<void> addLamaran(LamaranModel lamaran) async =>
      await lamaranDataSource.addLamaran(lamaran);

  List<LamaranModel> getLamaran() => lamaranDataSource.getLamaran();

  Future<void> updateLamaran(int index, LamaranModel lamaran) async =>
      await lamaranDataSource.updateLamaran(index, lamaran);

  Future<void> deleteLamaran(int index) async =>
      await lamaranDataSource.deleteLamaran(index);
}
