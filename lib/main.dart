import 'package:flutter/material.dart';
import 'package:yolda_app/presentation/app_widget.dart';
import 'package:yolda_app/presentation/core/app_init.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppInit.initializeApp();
  
  runApp(const AppWidget());
}
