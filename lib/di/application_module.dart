import 'package:get_it/get_it.dart';
import 'package:job_tracker/di/data_source_module.dart';
import 'package:job_tracker/di/repository_module.dart';

final locator = GetIt.instance;

Future<void> init() async {
  initDataSourceModule(locator);
  initRepositoryModule(locator);
}
