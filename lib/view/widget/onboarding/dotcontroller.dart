import '../../../controller/onboarding_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/onboarding_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CustomDotOnBoarding extends StatelessWidget {
  const CustomDotOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
      builder:
          (controller) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              onBoardingList.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: controller.currentPage == index ? 22 : 8,
                height: 8,
                decoration: BoxDecoration(
                  gradient:
                      controller.currentPage == index
                          ? LinearGradient(
                            colors: [
                              AppColor.primaryColor.withAlpha(
                                (0.9 * 255).toInt(),
                              ),
                              AppColor.primaryColor.withAlpha(
                                (0.6 * 255).toInt(),
                              ),
                            ],
                          )
                          : LinearGradient(
                            colors: [
                              AppColor.primaryColor.withAlpha(
                                (0.3 * 255).toInt(),
                              ),
                              AppColor.primaryColor.withAlpha(
                                (0.1 * 255).toInt(),
                              ),
                            ],
                          ),
                  borderRadius: BorderRadius.circular(50),
                  boxShadow:
                      controller.currentPage == index
                          ? [
                            BoxShadow(
                              color: AppColor.primaryColor.withAlpha(
                                (0.4 * 255).toInt(),
                              ),
                              blurRadius: 6,
                              spreadRadius: 1,
                              offset: const Offset(0, 2),
                            ),
                          ]
                          : [],
                ),
              ),
            ),
          ),
    );
  }
}
