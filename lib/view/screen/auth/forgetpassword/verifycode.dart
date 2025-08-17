import '../../../../controller/auth/forgetpassword/verifycode_controller.dart';
import '../../../../core/constant/background_container.dart';
import '../../../../core/constant/color.dart';
import '../../../widget/auth/customappbarauthandback.dart';
import '../../../widget/auth/custombuttomauth.dart';
import '../../../widget/auth/customotpfield.dart';
import '../../../widget/auth/customtextroutto.dart';
import '../../../widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    final VerifyCodeControllerImp controller =
        Get.find<VerifyCodeControllerImp>();

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
                SizedBox(height: isLandscape ? 20 : 40),
                Customtexttitleauth(text: 'enter_verification_code'.tr),
                const SizedBox(height: 8),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColor.grey,
                      fontSize: isLandscape ? 14 : 16,
                    ),
                    children: [
                      TextSpan(text: 'code_sent_to'.tr),
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

                CustomOtpField(
                  controller: controller.pinController,
                  errorController: controller.errorController,
                  onCompleted: (value) {
                    controller.verifyOtp(controller.pinController);
                  },
                  hasError: controller.hasError,
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
