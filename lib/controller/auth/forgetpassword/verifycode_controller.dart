import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../core/constant/routes.dart';
import 'package:get/get.dart';

import '../../../core/utils/snackbar_util.dart';

abstract class VerifyCodeController extends GetxController {
  verifyOtp(TextEditingController controller);
  resendOtp();
}

class VerifyCodeControllerImp extends VerifyCodeController {
  final TextEditingController pinController = TextEditingController();
  late String email;
  final isLoading = false.obs;
  final hasError = false.obs;
  final errorController = StreamController<ErrorAnimationType>.broadcast();

  @override
  void onInit() {
    super.onInit();

    email = Get.arguments['email'] ?? '';
  }

  @override
  verifyOtp(TextEditingController controller) async {
    if (pinController.text.isEmpty ||
        pinController.text.length != 6 ||
        !RegExp(r'^\d{6}$').hasMatch(pinController.text)) {
      errorController.add(ErrorAnimationType.shake);
      hasError.value = true;
      pinController.clear();
      return;
    }
    showSuccessSnackbar(
      title: 'success'.tr,
      message: 'Verification successful',
    );
    await Future.delayed(const Duration(milliseconds: 300));
    Get.offAllNamed(AppRoute.resetpassword);
  }

  @override
  resendOtp() {
    showInfoSnackbar(title: 'info', message: 'OTP resent successfully');
  }
}
