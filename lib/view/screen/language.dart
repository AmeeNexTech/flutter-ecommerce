import 'package:ecommerceshoporia/core/constant/routes.dart';
import 'package:ecommerceshoporia/core/localization/changelocal.dart';
import 'package:ecommerceshoporia/view/widget/language/custombuttomlang.dart';
import 'package:ecommerceshoporia/view/widget/onboarding/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Language extends GetView<LocaleController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("1".tr, style: Theme.of(context).textTheme.headlineMedium),

              SizedBox(height: 12),

              Text(
                "2".tr,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),

              SizedBox(height: 40),

              const SizedBox(height: 20),

              Column(
                children: [
                  SizedBox(
                    width: 350,
                    child: Custombuttomlang(
                      textbutton: "4".tr,
                      onPressed: () {
                        controller.changeLang("en");
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: 350,
                    child: Custombuttomlang(
                      textbutton: "5".tr,
                      onPressed: () {
                        controller.changeLang("ar");
                      },
                    ),
                  ),
                  const SizedBox(height: 42),

                  CustomButtonOnBoarding(
                    text: "6".tr,
                    onPressed: () {
                      Get.offAllNamed(AppRoute.onboarding);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
