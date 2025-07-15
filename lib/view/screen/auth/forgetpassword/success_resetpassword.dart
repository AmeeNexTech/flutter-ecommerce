import 'package:ecommerceshoporia/core/constant/background_container.dart';
import 'package:ecommerceshoporia/view/widget/auth/customappbarauth.dart';
import 'package:ecommerceshoporia/view/widget/auth/customtextbodyauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerceshoporia/controller/auth/success_reset_password_controller.dart';

class SuccessResetPassword extends StatefulWidget {
  const SuccessResetPassword({super.key});

  @override
  State<SuccessResetPassword> createState() => _SuccessResetPasswordState();
}

class _SuccessResetPasswordState extends State<SuccessResetPassword>
    with TickerProviderStateMixin {
  late SuccessResetPasswordController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<SuccessResetPasswordController>();
    controller.init(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Customappbarauth(text: "success".tr),
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
                  'password_reset_successful'.tr,
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
