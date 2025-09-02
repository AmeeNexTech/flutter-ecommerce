import '../../../core/constant/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../core/utils/app_logger.dart';
import '../../../core/utils/snackbar_util.dart';
import '../../../data/repository/auth/user_repository.dart';

abstract class RecoverPasswordController extends GetxController {
  validateEmail();

  goToSignIn();
}

class RecoverPasswordControllerImp extends RecoverPasswordController {
  final UserRepository _userRepository = Get.find<UserRepository>();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  String? emailText;
  final isLoading = false.obs;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void validateEmail() async {
    final form = formstate.currentState;
    if (form == null || !form.validate()) {
      autovalidateMode = AutovalidateMode.always;
      update();
      return;
    }

    form.save();
    isLoading.value = true;

    try {
      final response = await _userRepository.forgotPassword(
        email: email.text.trim(),
      );

      showSuccessSnackbar(message: response.message);
      Get.toNamed(AppRoute.verifycode, arguments: {'email': email.text});
    } catch (e) {
      showErrorSnackbar(message: e.toString());
      AppLogger.e('Signup error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  goToSignIn() {
    Get.back();
    email.clear();
  }

  @override
  void onClose() {
    email.dispose();
    super.onClose();
  }
}
