import 'package:flutter/material.dart';
import 'package:technical_task_app/widgets/custom_appbar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar("Login", true),
      body: Center(child: Text("This is the Login Screen")),
    );
  }
}
