import '../../../../../routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../../core/utils/app_logger.dart';
import '../../../../../core/utils/snackbar_util.dart';
import '../../../domain/usecases/forgot_password_usecase.dart';

abstract class RecoverPasswordController extends GetxController {
  validateEmail();
  goToSignIn();
}

class RecoverPasswordControllerImp extends RecoverPasswordController {
  final ForgotPasswordUseCase _forgotPasswordUseCase =
      Get.find<ForgotPasswordUseCase>();
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

    final result = await _forgotPasswordUseCase(
      ForgotPasswordParams(email: email.text.trim()),
    );
    isLoading.value = false;

    result.fold(
      (failure) {
        showErrorSnackbar(message: failure.message);
        AppLogger.e('Forgot Password error: ${failure.message}');
      },
      (response) {
        showSuccessSnackbar(message: response.message);
        Get.toNamed(AppRoute.verifycode, arguments: {'email': email.text});
      },
    );
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
