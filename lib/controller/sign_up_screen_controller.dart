// controller/sign_up_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreenController extends GetxController {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  final passwordStrengthLevel = 0.obs;
  final passwordStrengthLabel = "Very Weak".obs;
  final isPasswordValid = false.obs;

  void onPasswordChanged(String password) {
    passwordStrengthLevel.value = _getPasswordLevel(password);
    passwordStrengthLabel.value = _getStrengthLabel(passwordStrengthLevel.value);
    isPasswordValid.value = _isPasswordValid(password);
  }

  int _getPasswordLevel(String password) {
    final length = password.length;
    if (length >= 10) return 4;
    if (length >= 8) return 3;
    if (length >= 6) return 2;
    if (length >= 3) return 1;
    return 0;
  }

  String _getStrengthLabel(int level) {
    switch (level) {
      case 1:
        return "Very Weak";
      case 2:
        return "Weak";
      case 3:
        return "Strong";
      case 4:
        return "Very Strong";
      default:
        return "Very Weak";
    }
  }

  bool _isPasswordValid(String password) {
    final hasLetters = RegExp(r'[A-Za-z]').hasMatch(password);
    final hasNumbers = RegExp(r'[0-9]').hasMatch(password);
    return password.length >= 8 && hasLetters && hasNumbers;
  }

  @override
  void onClose() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
