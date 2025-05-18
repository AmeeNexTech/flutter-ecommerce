import 'package:ecommerceshoporia/controller/auth/login_controller.dart';
import 'package:ecommerceshoporia/core/constant/color.dart';
import 'package:ecommerceshoporia/view/widget/auth/customappbarauth.dart';
import 'package:ecommerceshoporia/view/widget/auth/custombuttomauth.dart';
import 'package:ecommerceshoporia/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerceshoporia/view/widget/auth/customtextformauth.dart';
import 'package:ecommerceshoporia/view/widget/auth/customtextroutto.dart';
import 'package:ecommerceshoporia/view/widget/auth/customtexttitleauth.dart';
import 'package:ecommerceshoporia/view/widget/auth/logoauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});
  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
      appBar: Customappbarauth(text: 'sign1'.tr),
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
            LogoAuth(),
            Customtexttitleauth(text: 'sign2'.tr),
            const SizedBox(height: 10),
            Customtextbodyauth(text: 'sign3'.tr),
            const SizedBox(height: 50),
            Customtextformauth(
              labeltext: "sign4".tr,
              iconData: Icons.email_outlined,
              mycontroller: controller.email,
            ),
            const SizedBox(height: 20),
            Customtextformauth(
              labeltext: "sign5".tr,
              iconData: Icons.lock_outline,
              mycontroller: controller.password,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  controller.goToRecoverPassword();
                },
                child: Text(
                  "sign6".tr,
                  style: TextStyle(
                    color: AppColor.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Custombuttomauth(text: 'sign7'.tr, onPressed: () {}),
            SizedBox(height: 30),
            CustomTextroutto(
              text: 'sign8'.tr,
              textButton: 'sign9'.tr,
              onPressed: () {
                controller.goToSignUp();
              },
            ),
          ],
        ),
      ),
    );
  }
}
