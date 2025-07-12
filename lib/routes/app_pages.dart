import 'package:get/get.dart';
import 'package:technical_task_app/views/auth/forgor_password_screen.dart';
import 'package:technical_task_app/views/auth/reset_password_screen.dart';
import 'package:technical_task_app/views/auth/sign_in_screen.dart';
import 'package:technical_task_app/views/auth/sign_up_screen.dart';
import 'package:technical_task_app/views/auth/verify_code_screen.dart';
import 'package:technical_task_app/views/enable_location_screen.dart';
import 'package:technical_task_app/views/select_language_screen.dart';
import 'package:technical_task_app/views/splash_screen.dart';
import '../views/onboarding_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.splash, page: () => SplashScreen()),
    GetPage(name: AppRoutes.onboarding, page: () => OnboardingScreen()),
    GetPage(name: AppRoutes.signIn, page: () => SignInScreen()),
    GetPage(name: AppRoutes.signUp, page: () => SignUpScreen()),
    GetPage(name: AppRoutes.forgotPass, page: () => ForgorPasswordScreen()),
    GetPage(name: AppRoutes.resetPass, page: () => ResetPasswordScreen()),
    GetPage(name: AppRoutes.verifyCode, page: () => VerifyCodeScreen()),
    GetPage(name: AppRoutes.enableLocation, page: () => EnableLocationSceen()),
    GetPage(name: AppRoutes.selectLanguage, page: () => SelectLanguageScreen()),
  ];
}
