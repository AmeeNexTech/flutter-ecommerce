import 'package:ecommerceshoporia/controller/auth/verifycode_controller.dart';
import 'package:ecommerceshoporia/core/constant/color.dart';
import 'package:ecommerceshoporia/view/widget/auth/customappbarauthandback.dart';
import 'package:ecommerceshoporia/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImp controller = Get.put(VerifyCodeControllerImp());
    return Scaffold(
      appBar: Customappbarauthandback(text: "verify_code".tr),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColor.backgroundcolor, AppColor.backgroundcolor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          children: [
            const SizedBox(height: 40),
            Customtexttitleauth(text: 'enter_verification_code'.tr),
            const SizedBox(height: 8),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColor.grey,
                  fontSize: 16,
                ),
                children: [
                  TextSpan(text: "code_sent_to".tr),
                  TextSpan(
                    text: "ameen@gmail.com.",
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
                controller.goToResetPassword();
              },
            ),
          ],
        ),
      ),
    );
  }
}
