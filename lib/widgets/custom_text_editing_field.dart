import 'package:flutter/material.dart';

class CustomTextEditingField extends StatefulWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isPassword;
  final TextStyle? labelStyle;

  const CustomTextEditingField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.labelStyle,
  });

  @override
  State<CustomTextEditingField> createState() => _CustomTextEditingFieldState();
}

class _CustomTextEditingFieldState extends State<CustomTextEditingField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Text(
          widget.label,
          style: widget.labelStyle ??
              const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.black,
              ),
        ),
        const SizedBox(height: 6),

        // Input Field
        TextField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: widget.isPassword ? _obscureText : false,
          decoration: InputDecoration(
            hintText: widget.hintText,
            contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 0.5),
              borderRadius: BorderRadius.circular(30),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blueAccent, width: 1),
              borderRadius: BorderRadius.circular(30),
            ),
            suffixIcon: widget.isPassword
                ? IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey.shade600,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            )
                : null,
          ),
        ),
      ],
    );
  }
}
