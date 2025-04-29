import 'package:ecommerceshoporia/controller/onboarding_controller.dart';
import 'package:ecommerceshoporia/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  final String text;
  final VoidCallback? onPressed;

  const CustomButtonOnBoarding({
    Key? key,
    required this.text,
    required this.onPressed,
  });

  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: AppColor.primaryColor,
          foregroundColor: Colors.white,
          elevation: 10,
          shadowColor: AppColor.primaryColor.withOpacity(0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        child: Text(text),
      ),
    );
  }
}
