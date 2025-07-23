// ignore_for_file: constant_identifier_names

import 'package:job_tracker/resources/constants/app_constants.dart';

enum Flavor { DEVELOPMENT, PRODUCTION }

class ConfigApps {
  final Flavor? flavor;
  static ConfigApps? _instance;

  factory ConfigApps({
    Flavor? flavor,
  }) {
    _instance ??= ConfigApps._create(flavor);
    return _instance!;
  }

  ConfigApps._create(
    this.flavor,
  );

  static ConfigApps? get instance {
    return _instance;
  }

  static bool isProduction() => _instance!.flavor == Flavor.PRODUCTION;

  static bool isStaging() => _instance!.flavor == Flavor.DEVELOPMENT;
  static String get lamaranBoxName {
    if (isProduction()) return AppConstants.HIVE_BOX_NAME_PROD;
    if (isStaging()) return AppConstants.HIVE_BOX_NAME_DEV;
    return AppConstants.HIVE_BOX_NAME;
  }
}
