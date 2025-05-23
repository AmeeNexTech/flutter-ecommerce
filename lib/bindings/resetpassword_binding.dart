import 'package:get/get.dart';
import 'package:ecommerceshoporia/controller/auth/resetpassword_controller.dart';

class ResetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResetPasswordControllerImp>(() => ResetPasswordControllerImp());
  }
}
