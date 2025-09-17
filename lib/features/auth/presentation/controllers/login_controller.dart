import '../../../../routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../core/services/storage/token_service.dart';
import '../../../../core/utils/snackbar_util.dart';
import '../../domain/usecases/login_usecase.dart';

abstract class LoginController extends GetxController {
  void login();

  void goToSignUp();

  void goToRecoverPassword();

  void showPassword();
}

class LoginControllerImp extends LoginController {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  // Controllers
  TextEditingController email = TextEditingController();

  String? emailText;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  final isLoading = false.obs;
  bool isPasswordHidden = true;
  TextEditingController password = TextEditingController();
  String? passwordText;

  final LoginUseCase _loginUseCase = Get.find<LoginUseCase>();
  final TokenService _tokenService = Get.find<TokenService>();

  @override
  goToRecoverPassword() {
    Get.toNamed(AppRoute.recoverpassword);
  }

  @override
  goToSignUp() {
    Get.toNamed(AppRoute.signUp);
  }

  @override
  login() async {
    final formdata = formstate.currentState;
    if (formdata == null || !formdata.validate()) {
      autovalidateMode = AutovalidateMode.always;
      update();
      return;
    }
    formdata.save();
    isLoading.value = true;

    final result = await _loginUseCase(
      LoginParams(email: email.text.trim(), password: password.text.trim()),
    );
    isLoading.value = false;

    result.fold(
      (failure) {
        showErrorSnackbar(message: failure.message);
      },
      (loginResponse) async {
        if (loginResponse.data.token.isNotEmpty) {
          await _tokenService.saveToken(loginResponse.data.token);
        }
        await _tokenService.saveUser(loginResponse.data.user.toJson());

        Get.offAllNamed(AppRoute.home);
        showSuccessSnackbar(message: loginResponse.message);
      },
    );
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();

    super.onClose();
  }

  @override
  showPassword() {
    isPasswordHidden = !isPasswordHidden;
    update();
  }
}
