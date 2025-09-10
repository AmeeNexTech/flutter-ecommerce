import 'dart:async';
import 'package:get/get.dart';
import '../../../../routes/app_routes.dart';
import '../../../../core/services/storage/local_storage_service.dart';
import '../../../../core/services/storage/token_service.dart';

class SplashController extends GetxController {
  Timer? _timer;
  final LocalStorageService localStorageService = Get.find();
  final TokenService tokenService = Get.find();

  @override
  void onInit() {
    super.onInit();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer(const Duration(seconds: 3), () {
      _determineNextRoute();
    });
  }

  void _determineNextRoute() async {
    try {
      // Onboarding التحقق من
      final hasSeenOnBoarding =
          localStorageService.sharedPreferences.getBool('onboardingKey') ??
          false;

      if (!hasSeenOnBoarding) {
        // أول مرة - ابدأ بصفحة اللغة
        Get.offAllNamed(AppRoute.language);
      } else if (await tokenService.hasToken()) {
        // لديه توكن - اذهب للصفحة الرئيسية
        Get.offAllNamed(AppRoute.home);
      } else {
        // لا يوجد توكن - اذهب لصفحة تسجيل الدخول
        Get.offAllNamed(AppRoute.login);
      }
    } catch (e) {
      // في حالة حدوث خطأ، اذهب لصفحة تسجيل الدخول
      Get.offAllNamed(AppRoute.login);
    }
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
