import 'package:get_it/get_it.dart';
import 'package:job_tracker/services/lamaran/job_data_source.dart';

void initDataSourceModule(GetIt locator) {
  locator.registerLazySingleton<LamaranDataSource>(() => LamaranDataSource());
}
