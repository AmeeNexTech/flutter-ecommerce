import 'package:ecommerceshoporia/core/constant/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToRecoverPassword();
}

class LoginControllerImp extends LoginController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String? emailText;
  String? passwordText;
  bool isPasswordHidden = true;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  login() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();

      email.clear();
      password.clear();
    } else {
      autovalidateMode = AutovalidateMode.always;
      update();
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
