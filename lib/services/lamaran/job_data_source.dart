import 'package:hive/hive.dart';
import 'package:job_tracker/config/flavor_config.dart';
import 'package:job_tracker/services/lamaran/model/lamaran_model.dart';
import 'package:job_tracker/utils/utility.dart';

class LamaranDataSource {
  final Box<LamaranModel> lamaranBox =
      Hive.box<LamaranModel>(ConfigApps.lamaranBoxName);

  Future<void> addLamaran(LamaranModel lamaran) async {
    await lamaranBox.add(lamaran);
  }

  List<LamaranModel> getLamaran() {
    cprint("Box used: ${ConfigApps.lamaranBoxName}");
    return lamaranBox.values.toList();
  }

  Future<void> updateLamaran(int index, LamaranModel lamaran) async {
    await lamaranBox.putAt(index, lamaran);
  }

  Future<void> deleteLamaran(int index) async {
    await lamaranBox.deleteAt(index);
  }
}
