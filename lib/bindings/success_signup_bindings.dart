import 'package:get/get.dart';
import 'package:ecommerceshoporia/controller/auth/success_signup_controller.dart';

class SuccessSignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SuccessSignupController>(() => SuccessSignupController());
  }
}
