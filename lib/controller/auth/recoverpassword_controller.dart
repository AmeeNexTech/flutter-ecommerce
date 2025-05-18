import 'package:ecommerceshoporia/core/constant/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class RecoverPasswordController extends GetxController {
  goToSignIn();
  goToVerifyCode();
}

class RecoverPasswordControllerImp extends RecoverPasswordController {
  TextEditingController email = TextEditingController();

  @override
  goToSignIn() {
    Get.offAllNamed(AppRoute.login);
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  @override
  goToVerifyCode() {
    Get.toNamed(AppRoute.verifycode);
  }
}
