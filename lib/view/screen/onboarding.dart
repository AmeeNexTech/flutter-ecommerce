import 'package:ecommerceshoporia/controller/onboarding_controller.dart';
import 'package:ecommerceshoporia/core/constant/color.dart';
import 'package:ecommerceshoporia/view/widget/onboarding/custombutton.dart';
import 'package:ecommerceshoporia/view/widget/onboarding/customslider.dart';
import 'package:ecommerceshoporia/view/widget/onboarding/dotcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class OnBoarding extends GetView<OnBoardingControllerImp> {
  const OnBoarding({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(flex: 6, child: CustomSliderOnBoarding()),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    CustomDotOnBoarding(),
                    SizedBox(height: 60),
                    CustomButtonOnBoarding(
                      text: "7".tr,
                      onPressed: () {
                        controller.next();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
