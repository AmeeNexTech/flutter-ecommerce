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
      // التحقق من Onboarding
      final hasSeenOnBoarding =
          localStorageService.sharedPreferences.getBool('onboardingKey') ??
          false;

      if (!hasSeenOnBoarding) {
        // أول مرة - إلى صفحة اللغة أو Onboarding
        Get.offAllNamed(AppRoute.language);
      } else {
        // وجّه للـ Home مباشرة كـ guest، سواء فيه توكن أو لا
        Get.offAllNamed(AppRoute.home);
        // اختياري: لو عايز تفرق بين guest و logged-in في Home، استخدم tokenService لتحديث UI
      }
    } catch (e) {
      // في حالة خطأ، وجّه للـ Home كـ guest
      Get.offAllNamed(AppRoute.home);
    }
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
