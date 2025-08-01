import '../controller/home_controller.dart';
import '../controller/onboarding_controller.dart';
import '../controller/splash_controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    // تسجيل Controllers العامة
    Get.lazyPut<OnBoardingControllerImp>(() => OnBoardingControllerImp());
    Get.lazyPut<HomeControllerImp>(() => HomeControllerImp());
    Get.lazyPut<SplashController>(() => SplashController());
  }
}
