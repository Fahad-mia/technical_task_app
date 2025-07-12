import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyScreenController extends GetxController {
  final TextEditingController otpTextController = TextEditingController();
  final secondsRemaining = 60.obs;
  late Timer _timer;

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining.value > 0) {
        secondsRemaining.value--;
      } else {
        _timer.cancel();
      }
    });
  }

  String get formattedTime {
    final minutes = (secondsRemaining.value ~/ 60).toString().padLeft(2, '0');
    final seconds = (secondsRemaining.value % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  void resetTimer() {
    _timer.cancel();
    secondsRemaining.value = 60;
    startTimer();
  }

  @override
  void onClose() {
    _timer.cancel();
    otpTextController.dispose();
    super.onClose();
  }
}
