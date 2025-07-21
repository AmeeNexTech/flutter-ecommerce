import '../../core/constant/routes.dart';
import '../../core/localization/changelocal.dart';
import '../widget/language/custombuttomlang.dart';
import '../widget/onboarding/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language extends StatelessWidget {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LocaleController>();
    final screenSize = MediaQuery.of(context).size;
    final isPortrait = screenSize.height > screenSize.width;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: isPortrait ? double.infinity : screenSize.width * 0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(flex: isPortrait ? 1 : 2),

                  Text(
                    '1'.tr,
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 12),

                  Text(
                    '2'.tr,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),

                  const SizedBox(height: 32),

                  Custombuttomlang(
                    textbutton: '4'.tr,
                    onPressed: () => controller.changeLang('en'),
                  ),

                  const SizedBox(height: 24),

                  Custombuttomlang(
                    textbutton: '5'.tr,
                    onPressed: () => controller.changeLang('ar'),
                  ),

                  const SizedBox(height: 32),

                  CustomButtonOnBoarding(
                    text: '6'.tr,
                    onPressed: () => Get.offAllNamed(AppRoute.onboarding),
                  ),

                  Spacer(flex: isPortrait ? 1 : 2),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
