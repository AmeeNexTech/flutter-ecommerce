import 'package:ecommerceshoporia/controller/auth/resetpassword_controller.dart';
import 'package:ecommerceshoporia/core/constant/BackgroundContainer.dart';
import 'package:ecommerceshoporia/core/functions/validators.dart';
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
    ResetPasswordControllerImp controller =
        Get.find<ResetPasswordControllerImp>();

    return Scaffold(
      appBar: Customappbarauthandback(text: "reset_password".tr),
      body: BackgroundContainer(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 500),
            child: Form(
              key: controller.formstate,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: ListView(
                children: [
                  const SizedBox(height: 40),
                  Customtexttitleauth(text: 'reset_password_title'.tr),
                  const SizedBox(height: 8),
                  Customtextbodyauth(text: "reset_password_instruction".tr),
                  const SizedBox(height: 30),
                  GetBuilder<ResetPasswordControllerImp>(
                    builder:
                        (controller) => Customtextformauth(
                          valid: (val) => validatePassword(val!),
                          labeltext: "enter_password".tr,
                          iconData:
                              controller.isPasswordHidden
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                          mycontroller: controller.password,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: controller.isPasswordHidden,
                          suffixIconOnTap: () {
                            controller.showPassword();
                          },
                          onSaved:
                              (val) => controller.passwordText = val!.trim(),
                        ),
                  ),
                  const SizedBox(height: 20),
                  GetBuilder<ResetPasswordControllerImp>(
                    builder:
                        (controller) => Customtextformauth(
                          valid:
                              (val) => validateConfirmPassword(
                                val!,
                                controller.password.text,
                              ),
                          labeltext: "confirm_password".tr,
                          iconData:
                              controller.isconfirmPasswordHidden
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                          mycontroller: controller.repassword,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: controller.isconfirmPasswordHidden,
                          suffixIconOnTap: () {
                            controller.confirmPassword();
                          },
                          onSaved:
                              (val) => controller.repasswordText = val!.trim(),
                        ),
                  ),
                  const SizedBox(height: 40),
                  Custombuttomauth(
                    text: 'save'.tr,
                    onPressed: () => controller.resetPassword(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
