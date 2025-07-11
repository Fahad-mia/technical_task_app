import 'package:flutter/material.dart';
import '../utils/app_text/app_text_style.dart';

class CustomTextContainer extends StatefulWidget {
  final String headText;
  final String? titleText;
   const CustomTextContainer({super.key, required this.headText, this.titleText});

  @override
  State<CustomTextContainer> createState() => _CustomTextContainerState();
}

class _CustomTextContainerState extends State<CustomTextContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15),
          child: Text(widget.headText,
            textAlign: TextAlign.center,
            style: AppTextStyle.textStyleInter700Bold,

          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.topLeft,
            child: Text( widget.titleText != null ? widget.titleText! : "",

              textAlign: TextAlign.center,
              style: AppTextStyle.textStyleInter400OnBoardRegular,
            ),
          ),
        ),
      ],
    );
  }
}
