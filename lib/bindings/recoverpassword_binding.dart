import 'package:get/get.dart';
import 'package:ecommerceshoporia/controller/auth/recoverpassword_controller.dart';

class RecoverpasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecoverPasswordControllerImp>(
      () => RecoverPasswordControllerImp(),
    );
  }
}
