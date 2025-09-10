import '../../../../../routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../core/services/storage/token_service.dart';
import '../../../../../core/utils/snackbar_util.dart';
import '../../../domain/usecases/reset_password_usecase.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  final TokenService _tokenService = Get.find<TokenService>();
  final ResetPasswordUseCase _resetPasswordUseCase =
      Get.find<ResetPasswordUseCase>();

  TextEditingController password = TextEditingController();
  TextEditingController repassword = TextEditingController();

  String? passwordText;
  String? repasswordText;

  late String email;
  late String otp;

  bool isPasswordHidden = true;
  bool isconfirmPasswordHidden = true;

  final isLoading = false.obs;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void onInit() {
    super.onInit();
    email = Get.arguments['email'] ?? '';
    otp = Get.arguments['otp'] ?? '';
  }

  @override
  resetPassword() async {
    final formdata = formstate.currentState;
    if (formdata == null || !formdata.validate()) {
      autovalidateMode = AutovalidateMode.always;
      update();
      return;
    }

    formdata.save();
    isLoading.value = true;

    final result = await _resetPasswordUseCase(
      ResetPasswordParams(
        email: email.trim(),
        otp: otp.trim(),
        password: password.text.trim(),
        passwordConfirmation: repassword.text.trim(),
      ),
    );
    isLoading.value = false;

    result.fold(
      (failure) {
        showErrorSnackbar(message: failure.message);
      },
      (response) async {
        if (response.data.token.isNotEmpty) {
          await _tokenService.saveToken(response.data.token);
        }
        await _tokenService.saveUser(response.data.user.toJson());
        showSuccessSnackbar(message: response.message);
        Get.offAllNamed(AppRoute.successresetpassword);
        password.clear();
        repassword.clear();
      },
    );
  }

  showPassword() {
    isPasswordHidden = !isPasswordHidden;
    update();
  }

  confirmPassword() {
    isconfirmPasswordHidden = !isconfirmPasswordHidden;
    update();
  }

  @override
  void onClose() {
    password.dispose();
    repassword.dispose();
    super.onClose();
  }
}
