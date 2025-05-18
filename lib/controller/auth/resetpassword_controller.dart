import 'package:ecommerceshoporia/core/constant/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();
  goTosuccessresetpassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  TextEditingController password = TextEditingController();
  TextEditingController repassword = TextEditingController();

  @override
  goTosuccessresetpassword() {
    Get.offAllNamed(AppRoute.successresetpassword);
  }

  @override
  resetPassword() {}

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }
}
