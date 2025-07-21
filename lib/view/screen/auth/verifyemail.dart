import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../controller/auth/verifyemail_controller.dart';
import '../../../core/constant/background_container.dart';
import '../../../core/constant/color.dart';
import '../../widget/auth/customappbarauthandback.dart';
import '../../widget/auth/custombuttomauth.dart';
import '../../widget/auth/customtextroutto.dart';
import '../../widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    final VerifyEmailControllerImp controller =
        Get.find<VerifyEmailControllerImp>();

    // تحديد حجم الشاشة والاتجاه
    final screenSize = MediaQuery.of(context).size;
    final isLandscape = screenSize.width > screenSize.height;

    return Scaffold(
      appBar: Customappbarauthandback(text: 'verify_email'.tr),
      body: BackgroundContainer(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: ListView(
              children: [
                SizedBox(height: isLandscape ? 15 : 35),
                Customtexttitleauth(text: 'enter_email_verification_code'.tr),
                const SizedBox(height: 8),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColor.grey,
                      fontSize: isLandscape ? 14 : 16,
                    ),
                    children: [
                      TextSpan(text: 'we_sent_code_to'.tr),
                      TextSpan(
                        text: ': ${controller.email}',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.blue,
                          fontSize: isLandscape ? 14 : 16,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: isLandscape ? 20 : 30),

                PinCodeTextField(
                  appContext: context,
                  length: 6,
                  controller: controller.pinController,
                  keyboardType: TextInputType.number,
                  animationType: AnimationType.fade,
                  enableActiveFill: true,
                  onChanged: (value) {},
                  onCompleted: (value) {
                    controller.verifyOtp(controller.pinController);
                  },
                  errorAnimationController: controller.errorController,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(12),
                    fieldHeight: 55,
                    fieldWidth: 45,
                    activeFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    activeColor: Colors.blue,
                    selectedColor: Colors.blueAccent,
                    inactiveColor: Colors.grey,
                  ),
                ),

                const SizedBox(height: 10),
                Obx(
                  () =>
                      controller.hasError.value
                          ? const Text(
                            'يرجى إدخال رمز مكون من 6 أرقام صحيحة',
                            style: TextStyle(color: Colors.red, fontSize: 13),
                          )
                          : const SizedBox.shrink(),
                ),
                SizedBox(height: isLandscape ? 20 : 30),
                CustomTextroutto(
                  text: 'did_not_receive_code'.tr,
                  textButton: 'resend_code'.tr,
                  onPressed: () {
                    controller.resendOtp();
                  },
                ),
                SizedBox(height: isLandscape ? 20 : 30),
                Obx(
                  () => Custombuttomauth(
                    text: 'verify',
                    onPressed: () {
                      controller.verifyOtp(controller.pinController);
                    },
                    isLoading: controller.isLoading.value,
                    loadingText: 'verifying',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
