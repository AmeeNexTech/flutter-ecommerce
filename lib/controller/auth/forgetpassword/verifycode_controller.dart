import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../core/constant/routes.dart';
import 'package:get/get.dart';

import '../../../core/utils/app_logger.dart';
import '../../../core/utils/snackbar_util.dart';
import '../../../data/repository/auth/user_repository.dart';

abstract class VerifyCodeController extends GetxController {
  verifyOtp(TextEditingController controller);
  resendOtp();
}

class VerifyCodeControllerImp extends VerifyCodeController {
  final UserRepository _userRepository = Get.find<UserRepository>();

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
    hasError.value = false;
    isLoading.value = true;

    try {
      final response = await _userRepository.verifyResetOtp(
        email: email.trim(),
        otp: pinController.text.trim(),
      );

      if (response.status == 'success') {
        showSuccessSnackbar(message: response.message);
        await Future.delayed(const Duration(milliseconds: 300));
        Get.offAllNamed(
          AppRoute.resetpassword,
          arguments: {'email': email, 'otp': pinController.text.trim()},
        );
      } else {
        // Handle error response (status = 'error')
        errorController.add(ErrorAnimationType.shake);
        hasError.value = true;
        pinController.clear();
        showErrorSnackbar(message: response.message);
      }
    } catch (e) {
      errorController.add(ErrorAnimationType.shake);
      hasError.value = true;
      pinController.clear();

      showErrorSnackbar(message: e.toString());
      AppLogger.e('Verify OTP error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  resendOtp() async {
    isLoading.value = true;
    try {
      final response = await _userRepository.resendResetOtp(email: email);
      showInfoSnackbar(message: response.message);
    } catch (e) {
      showErrorSnackbar(message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
