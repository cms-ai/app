enum AppEnviroment {
  dev,
  prod,
}

extension AppEnviromentExt on AppEnviroment {
  String get getCurrentBaseUrl {
    switch (this) {
      case AppEnviroment.dev:
        return "https://example/dev";
      case AppEnviroment.prod:
        return "https://example/prod";
      default:
        return "https://example/dev"; 
    }
  }
}

class AppFlavorsUtils {
  static String baseUrl = 'exmaple.dev';
}