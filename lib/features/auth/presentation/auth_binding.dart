import 'controllers/login_controller.dart';
import 'controllers/forgetpassword/recoverpassword_controller.dart';
import 'controllers/forgetpassword/resetpassword_controller.dart';
import 'controllers/signup_controller.dart';
import 'controllers/forgetpassword/success_reset_password_controller.dart';
import 'controllers/success_signup_controller.dart';
import 'controllers/forgetpassword/verifycode_controller.dart';
import 'controllers/verifyemail_controller.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginControllerImp>(() => LoginControllerImp());
    Get.lazyPut<SignupControllerImp>(() => SignupControllerImp());
    Get.lazyPut<VerifyEmailControllerImp>(() => VerifyEmailControllerImp());
    Get.lazyPut<RecoverPasswordControllerImp>(
      () => RecoverPasswordControllerImp(),
    );
    Get.lazyPut<ResetPasswordControllerImp>(() => ResetPasswordControllerImp());
    Get.lazyPut<VerifyCodeControllerImp>(() => VerifyCodeControllerImp());
    Get.lazyPut<SuccessSignupController>(() => SuccessSignupController());
    Get.lazyPut<SuccessResetPasswordController>(
      () => SuccessResetPasswordController(),
    );
  }
}
