import 'package:ecommerceshoporia/controller/auth/verifyemail_controller.dart';
import 'package:ecommerceshoporia/core/constant/BackgroundContainer.dart';
import 'package:ecommerceshoporia/core/constant/color.dart';
import 'package:ecommerceshoporia/view/widget/auth/customappbarauthandback.dart';
import 'package:ecommerceshoporia/view/widget/auth/customtextroutto.dart';
import 'package:ecommerceshoporia/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyEmailControllerImp controller = Get.find<VerifyEmailControllerImp>();
    return Scaffold(
      appBar: Customappbarauthandback(text: "verify_email".tr),
      body: BackgroundContainer(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 500),
            child: ListView(
              children: [
                const SizedBox(height: 40),
                Customtexttitleauth(text: 'enter_email_verification_code'.tr),
                const SizedBox(height: 8),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColor.grey,
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(text: "we_sent_code_to".tr),
                      TextSpan(
                        text: ": ameen@gmail.com", // اجلب الإيميل ديناميكياً
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.blue,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),
                OtpTextField(
                  numberOfFields: 5,
                  borderColor: Colors.blue.shade700,
                  focusedBorderColor: Colors.blueAccent,
                  showFieldAsBox: true,
                  borderRadius: BorderRadius.circular(12),
                  cursorColor: Colors.blue,
                  fieldWidth: 50,
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  onCodeChanged: (String code) {},
                  onSubmit: (String verificationCode) {
                    controller.goTosuccessverifyemaile();
                  },
                ),
                SizedBox(height: 30),
                CustomTextroutto(
                  text: "did_not_receive_code".tr,
                  textButton: "resend_code".tr,
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
