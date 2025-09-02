import '../../core/constant/routes.dart';
import '../../core/utils/app_logger.dart';
import '../../core/utils/snackbar_util.dart';
import '../../data/repository/auth/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignupController extends GetxController {
  void signup();
  void goToLogin();
  void showPassword();
}

class SignupControllerImp extends SignupController {
  final UserRepository _userRepository = Get.find<UserRepository>();

  // Controllers
  final username = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final isLoading = false.obs;
  bool isPasswordHidden = true;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void signup() async {
    final form = formKey.currentState;
    if (form == null || !form.validate()) {
      autovalidateMode = AutovalidateMode.always;
      update();
      return;
    }

    form.save();
    isLoading.value = true;

    try {
      final response = await _userRepository.register(
        name: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phone.text.trim(),
        password: password.text,
      );

      showSuccessSnackbar(message: response.message);

      Get.toNamed(AppRoute.verifyemail, arguments: {'email': email.text});
    } catch (e) {
      showErrorSnackbar(message: e.toString());
      AppLogger.e('Signup error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void goToLogin() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void showPassword() {
    isPasswordHidden = !isPasswordHidden;
    update();
  }

  @override
  void onClose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.onClose();
  }
}
