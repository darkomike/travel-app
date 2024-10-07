class AppConfig {
  static  AppConfig _instance = AppConfig._();
  AppConfig._();

  factory AppConfig() => _instance;

  String appName = 'Travel App';
  String apiVersion = '1.0.0';

  static void reset() => _instance = AppConfig._();

  
}
