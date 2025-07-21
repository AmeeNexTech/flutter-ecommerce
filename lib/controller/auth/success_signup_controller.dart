import '../../core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessSignupController extends GetxController {
  late AnimationController animationController;
  late Animation<double> scaleAnimation;

  void init(TickerProvider ticker) {
    animationController = AnimationController(
      vsync: ticker,
      duration: const Duration(milliseconds: 700),
    );

    scaleAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.elasticOut,
    );

    animationController.forward();

    Future.delayed(const Duration(seconds: 4), goToLogin);
  }

  void goToLogin() {
    Get.offAllNamed(AppRoute.login);
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
