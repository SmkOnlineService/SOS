class AppConfig {

  static AppConfig? instance;

  final Flavor flavor;
  final String flavorName;
  final String baseURL;
  final String packageName;
  final String version;
  final String build;

  AppConfig({
    required this.flavor,
    required this.flavorName,
    required this.baseURL,
    required this.packageName,
    required this.version,
    required this.build,
  });

  static void load({
    Flavor flavor = Flavor.production,
    required String version,
    required String build,
  }) {
    switch (flavor) {
      case Flavor.staging:
        instance = AppConfig(
          flavor: flavor,
          flavorName: 'Staging',
          baseURL: "https://alicestech.com/sos/api/",
          packageName: 'com.smk_online_service',
          version: version,
          build: build,
        );
        break;
      default:
        instance = AppConfig(
          flavor: flavor,
          flavorName: 'Production',
          baseURL: "https://alicestech.com/sos/api/",
          packageName: 'com.smk_online_service',
          version: version,
          build: build,
        );
        break;
    }
  }
}

enum Flavor {
  production,
  staging
}