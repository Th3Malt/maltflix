import 'dart:async';

import 'package:maltflix/app_imports.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Environment.loadEnv();
  await ServiceLocator.setupServiceLocator();

  runApp(const App());
}
