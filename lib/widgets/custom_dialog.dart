import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_task_app/utils/app_colord.dart';
import 'package:technical_task_app/widgets/custom_button.dart';

class CustomImageTextDialog extends StatelessWidget {
  final String imagePath;
  final String message;
  final String? title;
  final VoidCallback? onConfirm;
  final String? confirmText;

  const CustomImageTextDialog({
    super.key,
    required this.imagePath,
    required this.message,
    this.title,
    this.onConfirm,
    this.confirmText,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.screenColors,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 12),
                Image.asset(imagePath, height: 100),
                const SizedBox(height: 12),
                if (title != null)
                  Text(
                    title!,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                const SizedBox(height: 8),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                CustomButton(
                  label: confirmText ?? "Continue",
                  onPressed: onConfirm ?? () => Get.back(),
                  borderRadius: 100,
                ),
              ],
            ),
          ),
          Positioned(
            right: 15,
            top: 8,
            child: GestureDetector(
              onTap: () => Get.back(),
              child: const Icon(Icons.close, size: 24),
            ),
          ),
        ],
      ),
    );
  }
}
