import 'package:get/get.dart';
import 'package:ecommerceshoporia/controller/auth/verifyemail_controller.dart';

class VerifyEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifyEmailControllerImp>(() => VerifyEmailControllerImp());
  }
}
