import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_task_app/routes/app_pages.dart';
import 'package:technical_task_app/routes/app_routes.dart';
import 'package:technical_task_app/utils/app_colord.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'technical_test',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      getPages: AppPages.pages,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.screenColors,
        // You can add other theme properties here if needed
      ),
    );

  }
}
