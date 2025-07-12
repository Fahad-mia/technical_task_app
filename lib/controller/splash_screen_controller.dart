import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_task_app/routes/app_routes.dart';
import '../views/onboarding_screen.dart'; // adjust path

class SplashScreenController extends GetxController with GetTickerProviderStateMixin {
  late AnimationController rotationController;

  @override
  void onInit() {
    super.onInit();

    // Rotation animation
    rotationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();


    Timer(const Duration(seconds: 3), () {
      Get.offAllNamed(AppRoutes.onboarding); // Completely remove splash from stack
    });

  }

  @override
  void onClose() {
    rotationController.dispose();
    super.onClose();
  }
}
