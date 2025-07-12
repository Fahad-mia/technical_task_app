import 'package:flutter/material.dart';
import '../utils/app_text/app_text_style.dart';

class CustomTextContainer extends StatelessWidget {
  final String headText;
  final String? titleText;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;

  const CustomTextContainer({
    super.key,
    required this.headText,
    this.titleText,
    this.crossAxisAlignment,
    this.mainAxisAlignment
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: crossAxisAlignment != null
            ? crossAxisAlignment!
            : CrossAxisAlignment.center, // center horizontally
        mainAxisAlignment: mainAxisAlignment !=null
            ? mainAxisAlignment!
            : MainAxisAlignment.start,
        children: [
          Text(
            headText,
            textAlign: TextAlign.center,
            style: AppTextStyle.textStyleInter700Bold,
          ),
          const SizedBox(height: 10),
          Text(
            titleText ?? '',
            textAlign: TextAlign.center,
            style: AppTextStyle.textStyleInter400OnBoardRegular,
          ),
        ],
      ),
    );
  }
}
