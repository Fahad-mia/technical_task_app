import 'package:flutter/material.dart';

class OTPInputBox extends StatefulWidget {
  final TextEditingController controller;
  const OTPInputBox({super.key, required this.controller});

  @override
  State<OTPInputBox> createState() => _OTPInputBoxState();
}

class _OTPInputBoxState extends State<OTPInputBox> {
  final FocusNode focusNode = FocusNode();

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    return GestureDetector(
      onTap: () => focusNode.requestFocus(),
      child: Stack(
        children: [
          // Invisible TextField to capture input
          Opacity(
            opacity: 0,
            child: TextField(
              focusNode: focusNode,
              controller: widget.controller,
              keyboardType: TextInputType.number,
              maxLength: 4,
              autofocus: true,
              onChanged: (_) => setState(() {}),
            ),
          ),

          // Visible OTP boxes with flexible width
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 320),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                String char = "";
                if (widget.controller.text.length > index) {
                  char = widget.controller.text[index];
                }
                return Expanded(
                  child: Container(
                    height: 56,
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                    ),
                    child: Text(
                      char,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
