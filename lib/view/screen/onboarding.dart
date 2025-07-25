import '../../controller/onboarding_controller.dart';
import '../../core/constant/color.dart';
import '../widget/onboarding/custombutton.dart';
import '../widget/onboarding/customslider.dart';
import '../widget/onboarding/dotcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends GetView<OnBoardingControllerImp> {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<OnBoardingControllerImp>();

    return Scaffold(
      backgroundColor:
          AppColor
              .backgroundcolor, // جرب مسحه لتاكد انه الثيم العام يعمل ولا حاجه لهذا
      body: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) {
            final isPortrait = orientation == Orientation.portrait;

            if (isPortrait) {
              // الوضع الطولي - التخطيط العمودي
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Expanded(flex: 6, child: CustomSliderOnBoarding()),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          const CustomDotOnBoarding(),
                          const SizedBox(height: 60),
                          CustomButtonOnBoarding(
                            text: '7'.tr,
                            onPressed: () => controller.next(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else {
              //الوضع العرضي - التخطيط الأفقي
              return Row(
                children: [
                  const Expanded(flex: 5, child: CustomSliderOnBoarding()),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CustomDotOnBoarding(),
                          const SizedBox(height: 30),
                          CustomButtonOnBoarding(
                            text: '7'.tr,
                            onPressed: () => controller.next(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
