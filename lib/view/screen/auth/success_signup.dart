import 'package:ecommerceshoporia/controller/auth/success_signup_controller.dart';
import 'package:ecommerceshoporia/core/constant/background_container.dart';
import 'package:ecommerceshoporia/view/widget/auth/customappbarauth.dart';
import 'package:ecommerceshoporia/view/widget/auth/customtextbodyauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessVerifyEmail extends StatefulWidget {
  const SuccessVerifyEmail({super.key});

  @override
  State<SuccessVerifyEmail> createState() => _SuccessVerifyEmailState();
}

class _SuccessVerifyEmailState extends State<SuccessVerifyEmail>
    with TickerProviderStateMixin {
  late SuccessSignupController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<SuccessSignupController>();
    controller.init(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Customappbarauth(text: "successs".tr),
      body: BackgroundContainer(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ScaleTransition(
                  scale: controller.scaleAnimation,
                  child: Icon(
                    Icons.check_circle,
                    size: 120,
                    color: Colors.blue.shade600,
                    shadows: [
                      Shadow(color: Colors.green.shade200, blurRadius: 15),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  'done_check'.tr,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 10),
                Customtextbodyauth(text: 'go_to_login'.tr),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
