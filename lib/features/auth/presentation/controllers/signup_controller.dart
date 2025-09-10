import '../../../../routes/app_routes.dart';
import '../../../../core/utils/snackbar_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/usecases/register_usecase.dart';

abstract class SignupController extends GetxController {
  void signup();
  void goToLogin();
  void showPassword();
}

class SignupControllerImp extends SignupController {
  final RegisterUseCase _registerUseCase = Get.find<RegisterUseCase>();

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

    final result = await _registerUseCase(
      RegisterParams(
        name: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phone.text.trim(),
        password: password.text,
      ),
    );
    isLoading.value = false;

    result.fold(
      (failure) {
        showErrorSnackbar(message: failure.message);
      },
      (registerResponse) {
        Get.toNamed(AppRoute.verifyemail, arguments: {'email': email.text});
        showSuccessSnackbar(message: registerResponse.message);
      },
    );
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
