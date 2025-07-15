import 'package:ecommerceshoporia/controller/onboarding_controller.dart';
import 'package:ecommerceshoporia/core/constant/color.dart';
import 'package:ecommerceshoporia/core/constant/onboarding_data.dart';
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
                              AppColor.primaryColor.withOpacity(0.9),
                              AppColor.primaryColor.withOpacity(0.6),
                            ],
                          )
                          : LinearGradient(
                            colors: [
                              AppColor.primaryColor.withOpacity(0.3),
                              AppColor.primaryColor.withOpacity(0.1),
                            ],
                          ),
                  borderRadius: BorderRadius.circular(50),
                  boxShadow:
                      controller.currentPage == index
                          ? [
                            BoxShadow(
                              color: AppColor.primaryColor.withOpacity(0.4),
                              blurRadius: 6,
                              spreadRadius: 1,
                              offset: Offset(0, 2),
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
