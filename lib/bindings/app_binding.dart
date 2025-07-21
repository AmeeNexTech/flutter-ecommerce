import '../controller/onboarding_controller.dart';
import '../core/localization/changelocal.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    // تسجيل Controllers العامة
    Get.lazyPut<OnBoardingControllerImp>(() => OnBoardingControllerImp());
    Get.lazyPut<LocaleController>(() => LocaleController());
  }
}
