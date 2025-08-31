import '../../../core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessResetPasswordController extends GetxController {
  late AnimationController animationController;

  void init(TickerProvider ticker) {
    animationController = AnimationController(vsync: ticker);
  }

  void startAnimation(Duration duration) {
    animationController.duration = duration;
    animationController.forward();
  }

  void goToHome() {
    Get.offAllNamed(AppRoute.home);
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
