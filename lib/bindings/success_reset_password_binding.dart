import 'package:get/get.dart';
import 'package:ecommerceshoporia/controller/auth/success_reset_password_controller.dart';

class SuccessResetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SuccessResetPasswordController>(
      () => SuccessResetPasswordController(),
    );
  }
}
