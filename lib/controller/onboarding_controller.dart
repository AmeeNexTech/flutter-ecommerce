import 'package:ecommerceshoporia/core/constant/routes.dart';
import 'package:ecommerceshoporia/data/datasource/static/static.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class OnboardingController extends GetxController {
  next();
  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnboardingController {
  late PageController pageController;
  int currentPage = 0;
  @override
  next() {
    if (currentPage >= onBoardingList.length - 1) {
      Get.offAllNamed(AppRoute.login);
    } else {
      currentPage++;
      pageController.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 900),
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
}
