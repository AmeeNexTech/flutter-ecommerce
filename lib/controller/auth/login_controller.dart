import 'package:ecommerceshoporia/core/constant/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
}

class LoginControllerImp extends LoginController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  login() {}

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
