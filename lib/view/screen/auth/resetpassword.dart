import 'package:ecommerceshoporia/controller/auth/resetpassword_controller';
import 'package:ecommerceshoporia/core/constant/color.dart';
import 'package:ecommerceshoporia/view/widget/auth/customappbarauthandback.dart';
import 'package:ecommerceshoporia/view/widget/auth/custombuttomauth.dart';
import 'package:ecommerceshoporia/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerceshoporia/view/widget/auth/customtextformauth.dart';
import 'package:ecommerceshoporia/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller = Get.put(
      ResetPasswordControllerImp(),
    );
    return Scaffold(
      appBar: Customappbarauthandback(text: "reset_password".tr),
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
            Customtexttitleauth(text: 'reset_password_title'.tr),
            const SizedBox(height: 8),
            Customtextbodyauth(text: "reset_password_instruction".tr),
            const SizedBox(height: 30),
            Customtextformauth(
              labeltext: "enter_password".tr,
              iconData: Icons.lock_outline,
              mycontroller: controller.password,
            ),
            const SizedBox(height: 20),

            Customtextformauth(
              labeltext: "confirm_password".tr,
              iconData: Icons.lock_outline,
              mycontroller: controller.repassword,
            ),
            const SizedBox(height: 40),
            Custombuttomauth(
              text: 'save'.tr,
              onPressed: () {
                controller.goTosuccessresetpassword();
              },
            ),
          ],
        ),
      ),
    );
  }
}
