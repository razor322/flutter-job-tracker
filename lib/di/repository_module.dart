import 'package:get_it/get_it.dart';
import 'package:job_tracker/services/lamaran/job_repository.dart';

void initRepositoryModule(GetIt locator) {
  locator.registerLazySingleton<LamaranRepository>(
      () => LamaranRepository(locator()));
}
