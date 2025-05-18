import 'package:ecommerceshoporia/controller/auth/recoverpassword_controller.dart';
import 'package:ecommerceshoporia/core/constant/color.dart';
import 'package:ecommerceshoporia/view/widget/auth/customappbarauthandback.dart';
import 'package:ecommerceshoporia/view/widget/auth/custombuttomauth.dart';
import 'package:ecommerceshoporia/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerceshoporia/view/widget/auth/customtextformauth.dart';
import 'package:ecommerceshoporia/view/widget/auth/customtextroutto.dart';
import 'package:ecommerceshoporia/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecoverPassword extends StatelessWidget {
  const RecoverPassword({super.key});

  @override
  Widget build(BuildContext context) {
    RecoverPasswordControllerImp controller = Get.put(
      RecoverPasswordControllerImp(),
    );
    return Scaffold(
      appBar: Customappbarauthandback(text: "recover_password".tr),
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
            Customtexttitleauth(text: 'recover_password_subtitle'.tr),
            const SizedBox(height: 8),
            Customtextbodyauth(text: "recover_password_instruction".tr),
            const SizedBox(height: 30),
            Customtextformauth(
              labeltext: "email".tr,
              iconData: Icons.email_outlined,
              mycontroller: controller.email,
            ),
            const SizedBox(height: 40),
            Custombuttomauth(
              text: 'send_code'.tr,
              onPressed: () {
                controller.goToVerifyCode();
              },
            ),
            const SizedBox(height: 20),
            CustomTextroutto(
              text: 'remember_password'.tr,
              textButton: 'sign_in'.tr,
              onPressed: () {
                controller.goToSignIn();
              },
            ),
          ],
        ),
      ),
    );
  }
}
