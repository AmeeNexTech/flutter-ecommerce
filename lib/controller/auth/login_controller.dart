import '../../core/constant/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/services/storage/token_service.dart';
import '../../core/utils/app_logger.dart';
import '../../core/utils/snackbar_util.dart';
import '../../data/repository/auth/user_repository.dart';

abstract class LoginController extends GetxController {
  void login();
  void goToSignUp();
  void goToRecoverPassword();
  void showPassword();
}

class LoginControllerImp extends LoginController {
  final UserRepository _userRepository = Get.find<UserRepository>();
  final TokenService _tokenService = Get.find<TokenService>();

  // Controllers
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  String? emailText;
  String? passwordText;
  bool isPasswordHidden = true;
  final isLoading = false.obs;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

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

    try {
      final response = await _userRepository.login(
        email: email.text.trim(),
        password: password.text.trim(),
      );

      // حفظ التوكن وبيانات المستخدم
      if (response.data.token.isNotEmpty) {
        await _tokenService.saveToken(response.data.token);
      }
      await _tokenService.saveUser(response.data.user.toJson());

      showSuccessSnackbar(message: response.message);
      Get.offAllNamed(AppRoute.home);
    } catch (e) {
      showErrorSnackbar(message: e.toString());
      AppLogger.e('Login error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  goToRecoverPassword() {
    Get.toNamed(AppRoute.recoverpassword);
  }

  @override
  showPassword() {
    isPasswordHidden = !isPasswordHidden;
    update();
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();

    super.onClose();
  }
}
