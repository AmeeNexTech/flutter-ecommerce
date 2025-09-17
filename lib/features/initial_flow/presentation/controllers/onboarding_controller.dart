import '../../../../routes/app_routes.dart';
import '../../../../core/services/storage/local_storage_service.dart';
import '../../../../core/constant/onboarding_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class OnboardingController extends GetxController {
  next();
  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnboardingController {
  late PageController pageController;
  int currentPage = 0;
  LocalStorageService localStorageService = Get.find();

  @override
  next() {
    if (currentPage >= onBoardingList.length - 1) {
      localStorageService.sharedPreferences.setBool('onboardingKey', true);
      Get.offAllNamed(AppRoute.home);
    } else {
      currentPage++;
      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 900),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
