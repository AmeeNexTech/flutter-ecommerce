import 'controllers/onboarding_controller.dart';
import 'controllers/splash_controller.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    // تسجيل Controllers العامة
    Get.lazyPut<OnBoardingControllerImp>(() => OnBoardingControllerImp());
    Get.lazyPut<SplashController>(() => SplashController());
  }
}
