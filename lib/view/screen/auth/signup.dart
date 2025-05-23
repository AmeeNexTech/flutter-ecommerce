import 'package:ecommerceshoporia/controller/auth/signup_controller.dart';
import 'package:ecommerceshoporia/core/constant/BackgroundContainer.dart';
import 'package:ecommerceshoporia/core/functions/alertexitapp.dart';
import 'package:ecommerceshoporia/core/functions/validators.dart';
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
    SignupControllerImp controller = Get.find<SignupControllerImp>();

    return WillPopScope(
      onWillPop: () async {
        bool exit = await alertExitApp();
        return exit;
      },
      child: Scaffold(
        appBar: Customappbarauth(text: "signUp".tr),
        body: BackgroundContainer(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: controller.formstate,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 500),
                child: ListView(
                  children: [
                    Customtexttitleauth(text: "signUp1".tr),
                    const SizedBox(height: 10),
                    Customtextbodyauth(text: "signUp2".tr),
                    const SizedBox(height: 50),
                    Customtextformauth(
                      valid: (val) {
                        return validateUsername(val!);
                      },
                      labeltext: "fieldUsername".tr,
                      mycontroller: controller.username,
                      iconData: Icons.person_outline,
                      keyboardType: TextInputType.name,
                      onSaved: (val) => controller.usernameText = val!.trim(),
                    ),
                    const SizedBox(height: 20),
                    Customtextformauth(
                      valid: (val) {
                        return validateEmail(val!);
                      },
                      labeltext: "fieldEmail".tr,
                      mycontroller: controller.email,
                      iconData: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (val) => controller.emailText = val!.trim(),
                    ),

                    const SizedBox(height: 20),
                    Customtextformauth(
                      valid: (val) {
                        return validatePhone(val!);
                      },
                      labeltext: "fieldPhone".tr,
                      mycontroller: controller.phone,
                      iconData: Icons.phone_android_outlined,
                      keyboardType: TextInputType.phone,
                      onSaved: (val) => controller.phoneText = val!.trim(),
                    ),

                    const SizedBox(height: 20),
                    GetBuilder<SignupControllerImp>(
                      builder:
                          (controller) => Customtextformauth(
                            valid: (val) {
                              return validatePassword(val!);
                            },
                            mycontroller: controller.password,
                            labeltext: "fieldPassword".tr,
                            iconData:
                                controller.isPasswordHidden
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: controller.isPasswordHidden,
                            suffixIconOnTap: () {
                              controller.showPassword();
                            },
                            onSaved:
                                (val) => controller.passwordText = val!.trim(),
                          ),
                    ),

                    const SizedBox(height: 40),
                    Custombuttomauth(
                      text: "signUp3".tr,
                      onPressed: () {
                        controller.signup();
                      },
                    ),
                    SizedBox(height: 30),
                    CustomTextroutto(
                      text: "signUp4".tr,
                      textButton: "signUp5".tr,
                      onPressed: controller.goToLogin,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
