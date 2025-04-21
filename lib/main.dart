import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_task/flutter_task_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const FlutterTaskApp());
}