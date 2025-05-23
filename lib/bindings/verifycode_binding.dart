import 'package:get/get.dart';
import 'package:ecommerceshoporia/controller/auth/verifycode_controller.dart';

class VerifyCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifyCodeControllerImp>(() => VerifyCodeControllerImp());
  }
}
