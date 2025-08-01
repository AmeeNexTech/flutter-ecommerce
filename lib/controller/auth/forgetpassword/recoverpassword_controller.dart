import '../../../core/constant/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../core/utils/app_logger.dart';

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
    final formdata = formstate.currentState;

    if (formdata!.validate()) {
      formdata.save();

      AppLogger.i('Email to verify: $emailText');

      Get.toNamed(AppRoute.verifycode);
      email.clear();
    } else {
      AppLogger.w('Form is not valid');
    }
  }

  @override
  goToSignIn() {
    Get.back();
    email.clear();
  }

  @override
  void onClose() {
    email.dispose();
    super.onClose();
  }
}
