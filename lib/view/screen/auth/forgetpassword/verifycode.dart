import '../../../../controller/auth/verifycode_controller.dart';
import '../../../../core/constant/background_container.dart';
import '../../../../core/constant/color.dart';
import '../../../widget/auth/customappbarauthandback.dart';
import '../../../widget/auth/customtextroutto.dart';
import '../../../widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
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
    final isSmallScreen = screenSize.width < 400;

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
                        text: ': ameen@gmail.com', // اجلب الإيميل ديناميكياً
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.blue,
                          fontSize: isLandscape ? 14 : 16,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: isLandscape ? 20 : 30),

                // OTP Field مع تحسين للشاشات الصغيرة والوضع الأفقي
                LayoutBuilder(
                  builder: (context, constraints) {
                    // حساب العرض المناسب للحقول (5 حقول)
                    final availableWidth =
                        constraints.maxWidth - 40.0; // padding
                    final fieldWidth =
                        isSmallScreen
                            ? (availableWidth / 5) -
                                8.0 // 5 حقول مع margin
                            : isLandscape
                            ? 40.0
                            : 50.0;

                    return OtpTextField(
                      numberOfFields: 5,
                      borderColor: Colors.blue.shade700,
                      focusedBorderColor: Colors.blueAccent,
                      showFieldAsBox: true,
                      borderRadius: BorderRadius.circular(12),
                      cursorColor: Colors.blue,
                      fieldWidth: fieldWidth,
                      textStyle: TextStyle(
                        fontSize: isLandscape ? 16 : 20,
                        fontWeight: FontWeight.bold,
                      ),
                      margin: EdgeInsets.symmetric(
                        horizontal: isSmallScreen ? 2 : 8,
                      ),
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      onCodeChanged: (String code) {},
                      onSubmit: (String verificationCode) {
                        controller.goToResetPassword();
                      },
                    );
                  },
                ),

                SizedBox(height: isLandscape ? 20 : 30),
                CustomTextroutto(
                  text: 'did_not_receive_code'.tr,
                  textButton: 'resend_code'.tr,
                  onPressed: () {
                    // Add your resend code logic here
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
