import 'package:fitness_app/app/app.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:rive/rive.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await RiveNative.init();
  await Hive.openBox('app_box');
  runApp(const App());
}
