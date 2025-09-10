import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../routes/app_routes.dart';
import 'package:get/get.dart';
import '../../../../../core/utils/snackbar_util.dart';
import '../../../domain/usecases/resend_reset_otp_usecase.dart';
import '../../../domain/usecases/verify_reset_otp_usecase.dart';

abstract class VerifyCodeController extends GetxController {
  verifyOtp(TextEditingController controller);
  resendOtp();
}

class VerifyCodeControllerImp extends VerifyCodeController {
  final VerifyResetOtpUseCase _verifyResetOtpUseCase =
      Get.find<VerifyResetOtpUseCase>();
  final ResendResetOtpUseCase _resendResetOtpUseCase =
      Get.find<ResendResetOtpUseCase>();

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

    final result = await _verifyResetOtpUseCase(
      VerifyResetOtpParams(email: email.trim(), otp: pinController.text.trim()),
    );
    isLoading.value = false;

    result.fold(
      (failure) {
        errorController.add(ErrorAnimationType.shake);
        hasError.value = true;
        pinController.clear();
        showErrorSnackbar(message: failure.message);
      },
      (response) async {
        showSuccessSnackbar(message: response.message);
        Get.offAllNamed(
          AppRoute.resetpassword,
          arguments: {'email': email, 'otp': pinController.text.trim()},
        );
      },
    );
  }

  @override
  resendOtp() async {
    isLoading.value = true;
    final result = await _resendResetOtpUseCase(
      ResendResetOtpParams(email: email),
    );
    isLoading.value = false;

    result.fold(
      (failure) {
        showErrorSnackbar(message: failure.message);
      },
      (response) {
        showInfoSnackbar(message: response.message);
      },
    );
  }
}
