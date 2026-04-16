import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String getEnv(String name) => dotenv.env[name] ?? '';

  static String get apiKey => getEnv('API_KEY');

  static Future<void> loadEnv() async => await dotenv.load(fileName: '.env');
}
