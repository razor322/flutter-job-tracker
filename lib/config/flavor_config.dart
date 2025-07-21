// ignore_for_file: constant_identifier_names

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
}
