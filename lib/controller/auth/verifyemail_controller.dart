import 'package:ecommerceshoporia/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class VerifyEmailController extends GetxController {
  chackCode();
  goTosuccessverifyemaile();
}

class VerifyEmailControllerImp extends VerifyEmailController {
  late String verifycode;
  @override
  chackCode() {}
  @override
  goTosuccessverifyemaile() {
    Get.offAllNamed(AppRoute.successverifyemail);
  }
}
