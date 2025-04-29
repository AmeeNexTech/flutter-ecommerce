import 'package:ecommerceshoporia/controller/onboarding_controller.dart';
import 'package:ecommerceshoporia/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val) => controller.onPageChanged(val),
      itemCount: onBoardingList.length,
      itemBuilder:
          (context, i) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50),

                Image.asset(
                  onBoardingList[i].img!,
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.40,
                  fit: BoxFit.contain,
                ),

                const SizedBox(height: 70),

                Text(
                  onBoardingList[i].title!.tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),

                const SizedBox(height: 20),

                Text(
                  onBoardingList[i].body!.tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
    );
  }
}
