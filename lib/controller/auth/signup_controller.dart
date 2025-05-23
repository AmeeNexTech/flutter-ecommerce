import 'package:ecommerceshoporia/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignupController extends GetxController {
  signup();
  goToLogin();
}

class SignupControllerImp extends SignupController {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  String? usernameText;
  String? emailText;
  String? phoneText;
  String? passwordText;
  String? confirmpasswordText;

  bool isPasswordHidden = true;

  @override
  signup() {
    var formdata = formstate.currentState;

    if (formdata!.validate()) {
      formdata.save();

      Get.toNamed(AppRoute.verifyemail);

      // هنا تقوم بعمل لودنج تحميل حتي تتم عمليات الباك اند ثم تنتقل وبعدها تمسح
    } else {
      print("not valid");
    }
  }

  showPassword() {
    isPasswordHidden = !isPasswordHidden;
    update();
  }

  @override
  goToLogin() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onClose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    confirmpassword.dispose();
    super.onClose();
  }
}
