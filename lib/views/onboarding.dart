import 'package:flutter/material.dart';
import 'package:technical_task_app/widgets/custom_appbar.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> _imagePaths = [
    'assets/signal_image.png',
    'assets/onboard_image2.png',
  ];

  void _onNextPressed() {
    if (_currentPage < _imagePaths.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      // TODO: Navigate to next screen (e.g., home or login)
      // Example: Get.off(() => const HomeScreen());
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar("Onboarding", true),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _imagePaths.length,
              onPageChanged: (index) {
                setState(() => _currentPage = index);
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Image.asset(
                    _imagePaths[index],
                    fit: BoxFit.contain,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: ElevatedButton(
              onPressed: _onNextPressed,
              child: Text(_currentPage == _imagePaths.length - 1
                  ? 'Get Started'
                  : 'Next'),
            ),
          ),
        ],
      ),
    );
  }
}
