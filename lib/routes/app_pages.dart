import 'package:get/get.dart';
import 'package:technical_task_app/views/splash_screen.dart';
import '../views/onboarding.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () =>  SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.onboarding,
      page: () =>  Onboarding(),
    ),
  ];
}
