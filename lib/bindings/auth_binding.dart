import '../controller/auth/login_controller.dart';
import '../controller/auth/forgetpassword/recoverpassword_controller.dart';
import '../controller/auth/forgetpassword/resetpassword_controller.dart';
import '../controller/auth/signup_controller.dart';
import '../controller/auth/forgetpassword/success_reset_password_controller.dart';
import '../controller/auth/success_signup_controller.dart';
import '../controller/auth/forgetpassword/verifycode_controller.dart';
import '../controller/auth/verifyemail_controller.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    // ===== تسجيل جميع Controllers الخاصة بالمصادقة =====
    // يتم تسجيلها عند الحاجة فقط (lazy loading)
    // fenix: true يضمن بقاءها في الذاكرة بعد الاستخدام الأول
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
