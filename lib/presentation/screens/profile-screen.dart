import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_final/presentation/screens/test-screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Get.to(const TestScreen());
      },
      child: const Text("ProfileScreen"),
    );
  }
}
