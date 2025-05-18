import 'package:ecommerceshoporia/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  chackCode();
  goToResetPassword();
}

class VerifyCodeControllerImp extends VerifyCodeController {
  late String verifycode;
  @override
  chackCode() {}
  @override
  goToResetPassword() {
    Get.offNamed(AppRoute.resetpassword);
  }
}
