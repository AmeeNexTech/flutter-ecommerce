import 'package:ecommerceshoporia/core/constant/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class RecoverPasswordController extends GetxController {
  goToVerifyCode();

  goToSignIn();
}

class RecoverPasswordControllerImp extends RecoverPasswordController {
  TextEditingController email = TextEditingController();
  String? emailText;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  goToVerifyCode() {
    var formdata = formstate.currentState;

    if (formdata!.validate()) {
      formdata.save();

      print("Email to verify: $emailText");

      Get.toNamed(AppRoute.verifycode);
      email.clear();
    } else {
      print("Form is not valid");
    }
  }

  @override
  goToSignIn() {
    Get.offAllNamed(AppRoute.login);
    email.clear();
  }

  @override
  void onClose() {
    email.dispose();
    super.onClose();
  }
}
