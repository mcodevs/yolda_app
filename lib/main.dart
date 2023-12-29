import 'package:flutter/material.dart';
import 'package:yolda_app/presentation/app_scope.dart';
import 'package:yolda_app/presentation/core/app_init.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  /// Initialize App
  await AppInit.initializeApp();

  runApp(const AppScope());
}
