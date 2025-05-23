import 'package:ecommerceshoporia/controller/onboarding_controller.dart';
import 'package:ecommerceshoporia/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        final isPortrait = orientation == Orientation.portrait;

        return PageView.builder(
          controller: controller.pageController,
          onPageChanged: (val) => controller.onPageChanged(val),
          itemCount: onBoardingList.length,
          itemBuilder:
              (context, i) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (isPortrait) const SizedBox(height: 50),

                    Image.asset(
                      onBoardingList[i].img!,
                      width:
                          MediaQuery.of(context).size.width *
                          (isPortrait ? 0.9 : 0.5),
                      height:
                          MediaQuery.of(context).size.height *
                          (isPortrait ? 0.4 : 0.5),
                      fit: BoxFit.contain,
                    ),

                    SizedBox(height: isPortrait ? 30 : 10),

                    Flexible(
                      child: Text(
                        onBoardingList[i].title!.tr,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ),

                    SizedBox(height: isPortrait ? 20 : 10),

                    Flexible(
                      child: Text(
                        onBoardingList[i].body!.tr,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ],
                ),
              ),
        );
      },
    );
  }
}
