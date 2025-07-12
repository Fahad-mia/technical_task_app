import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String label;
  final TextStyle? labelStyle;
  final Color activeColor;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    required this.label,
    this.labelStyle,
    this.activeColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: activeColor,
        ),
        Flexible(
          child: Text(
            label,
            style: labelStyle ?? const TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }
}
