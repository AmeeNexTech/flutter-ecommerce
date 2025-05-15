import 'package:ecommerceshoporia/controller/auth/signup_controller.dart';
import 'package:ecommerceshoporia/core/constant/color.dart';
import 'package:ecommerceshoporia/view/widget/auth/customappbarauth.dart';
import 'package:ecommerceshoporia/view/widget/auth/custombuttomauth.dart';
import 'package:ecommerceshoporia/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerceshoporia/view/widget/auth/customtextformauth.dart';
import 'package:ecommerceshoporia/view/widget/auth/customtextroutto.dart';
import 'package:ecommerceshoporia/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});
  @override
  Widget build(BuildContext context) {
    SignupControllerImp controller = Get.put(SignupControllerImp());

    return Scaffold(
      appBar: Customappbarauth(text: "signUp".tr),
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColor.backgroundcolor, AppColor.backgroundcolor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          children: [
            Customtexttitleauth(text: "signUp1".tr),
            const SizedBox(height: 10),
            Customtextbodyauth(text: "signUp2".tr),
            const SizedBox(height: 50),
            Customtextformauth(
              labeltext: "fieldUsername".tr,
              mycontroller: controller.username,
              iconData: Icons.person_outline,
            ),
            const SizedBox(height: 20),
            Customtextformauth(
              labeltext: "fieldEmail".tr,
              mycontroller: controller.email,
              iconData: Icons.email_outlined,
            ),

            const SizedBox(height: 20),
            Customtextformauth(
              labeltext: "fieldPhone".tr,
              mycontroller: controller.phone,
              iconData: Icons.phone_android_outlined,
            ),

            const SizedBox(height: 20),
            Customtextformauth(
              mycontroller: controller.password,
              labeltext: "fieldPassword".tr,
              iconData: Icons.lock_outline,
            ),

            const SizedBox(height: 40),
            Custombuttomauth(text: "signUp3".tr, onPressed: () {}),
            SizedBox(height: 30),
            CustomTextroutto(
              text: "signUp4".tr,
              textButton: "signUp5".tr,
              onPressed: controller.goToLogin,
            ),
          ],
        ),
      ),
    );
  }
}
