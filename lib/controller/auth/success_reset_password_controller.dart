import 'package:ecommerceshoporia/core/constant/routes.dart';
import 'package:get/get.dart';

class SuccessResetPasswordController extends GetxController {
  void goToLogin() {
    Get.offAllNamed(AppRoute.login);
  }
}
