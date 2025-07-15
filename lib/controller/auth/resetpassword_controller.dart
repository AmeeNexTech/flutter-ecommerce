import 'package:ecommerceshoporia/core/constant/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  TextEditingController password = TextEditingController();
  TextEditingController repassword = TextEditingController();

  String? passwordText;
  String? repasswordText;

  bool isPasswordHidden = true;
  bool isconfirmPasswordHidden = true;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  resetPassword() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();

      Get.offAllNamed(AppRoute.successresetpassword);

      password.clear();
      repassword.clear();
    } else {
      print("Form is not valid");
    }
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
