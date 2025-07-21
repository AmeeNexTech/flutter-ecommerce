import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../core/constant/routes.dart';
import '../../core/services/storage/token_service.dart';
import '../../core/utils/app_logger.dart';
import '../../core/utils/snackbar_util.dart';
import '../../data/repository/auth/user_repository.dart';
import 'package:get/get.dart';

abstract class VerifyEmailController extends GetxController {
  verifyOtp(TextEditingController controller);
}

class VerifyEmailControllerImp extends VerifyEmailController {
  final UserRepository _userRepository = Get.find<UserRepository>();
  final TokenService _tokenService = Get.find<TokenService>();
  final TextEditingController pinController = TextEditingController();

  late String email;

  final isLoading = false.obs;
  final hasError = false.obs;
  final errorController = StreamController<ErrorAnimationType>.broadcast();

  @override
  void onInit() {
    super.onInit();
    // الحصول على البريد الإلكتروني من المعاملات
    email = Get.arguments['email'] ?? '';
  }

  @override
  verifyOtp(TextEditingController controller) async {
    if (pinController.text.isEmpty ||
        pinController.text.length != 6 ||
        !RegExp(r'^\d{6}$').hasMatch(pinController.text)) {
      errorController.add(ErrorAnimationType.shake);
      hasError.value = true;
      return;
    }
    hasError.value = false;
    isLoading.value = true;
    try {
      final response = await _userRepository.verifyOtp(
        email: email,
        otp: pinController.text,
      );
      // حفظ التوكن وبيانات المستخدم
      if (response.data.token.isNotEmpty) {
        await _tokenService.saveToken(response.data.token);
      }
      await _tokenService.saveUser(response.data.user.toJson());

      showSuccessSnackbar(title: 'success'.tr, message: response.message);

      // الانتقال للهوم أو واجهة النجاح
      await Future.delayed(const Duration(milliseconds: 300));
      Get.offAllNamed(AppRoute.successverifyemail);
    } catch (e) {
      errorController.add(ErrorAnimationType.shake);
      controller.clear();

      showErrorSnackbar(title: 'error', message: e.toString());
      AppLogger.e('Verify OTP error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> resendOtp() async {
    isLoading.value = true;
    try {
      final response = await _userRepository.resendOtp(email: email);
      showInfoSnackbar(title: 'info', message: response.message);
    } catch (e) {
      showErrorSnackbar(title: 'error', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
