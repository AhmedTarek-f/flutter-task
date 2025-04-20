import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/utlis/app_router.dart';
import 'package:flutter_task/core/utlis/app_theme.dart';
import 'package:flutter_task/features/home/presentation/views/home_view.dart';

class FlutterTaskApp extends StatelessWidget {
  const FlutterTaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392.72, 856.72),
      child: MaterialApp(
        title: 'Flutter Task',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        initialRoute: HomeView.routeName,
        routes: AppRouter.routes,
      ),
    );
  }
}