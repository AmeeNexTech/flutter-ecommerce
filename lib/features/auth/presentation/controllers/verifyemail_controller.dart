import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../routes/app_routes.dart';
import '../../../../core/services/storage/token_service.dart';
import '../../../../core/utils/snackbar_util.dart';
import 'package:get/get.dart';

import '../../domain/usecases/resend_otp_usecase.dart';
import '../../domain/usecases/verify_otp_usecase.dart';

abstract class VerifyEmailController extends GetxController {
  verifyOtp(TextEditingController controller);
  resendOtp();
}

class VerifyEmailControllerImp extends VerifyEmailController {
  final TokenService _tokenService = Get.find<TokenService>();
  final VerifyOtpUseCase _verifyOtpUseCase = Get.find<VerifyOtpUseCase>();
  final ResendOtpUseCase _resendOtpUseCase = Get.find<ResendOtpUseCase>();

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

    final result = await _verifyOtpUseCase(
      VerifyOtpParams(email: email.trim(), otp: pinController.text.trim()),
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
        if (response.data.token.isNotEmpty) {
          await _tokenService.saveToken(response.data.token);
        }
        await _tokenService.saveUser(response.data.user.toJson());
        showSuccessSnackbar(message: response.message);
        Get.offAllNamed(AppRoute.successverifyemail);
      },
    );
  }

  @override
  Future<void> resendOtp() async {
    isLoading.value = true;
    final result = await _resendOtpUseCase(ResendOtpParams(email: email));
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
