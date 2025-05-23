import 'package:get/get.dart';
import 'package:ecommerceshoporia/controller/auth/signup_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupControllerImp>(() => SignupControllerImp());
  }
}
