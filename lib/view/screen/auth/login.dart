import 'package:ecommerceshoporia/controller/auth/login_controller.dart';
import 'package:ecommerceshoporia/core/constant/BackgroundContainer.dart';
import 'package:ecommerceshoporia/core/constant/color.dart';
import 'package:ecommerceshoporia/core/functions/alertexitapp.dart';
import 'package:ecommerceshoporia/core/functions/validators.dart';
import 'package:ecommerceshoporia/view/widget/auth/customappbarauth.dart';
import 'package:ecommerceshoporia/view/widget/auth/custombuttomauth.dart';
import 'package:ecommerceshoporia/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerceshoporia/view/widget/auth/customtextformauth.dart';
import 'package:ecommerceshoporia/view/widget/auth/customtextroutto.dart';
import 'package:ecommerceshoporia/view/widget/auth/customtexttitleauth.dart';
import 'package:ecommerceshoporia/view/widget/auth/logoauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late LoginControllerImp controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<LoginControllerImp>();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool exit = await alertExitApp();
        return exit;
      },
      child: Scaffold(
        appBar: Customappbarauth(text: 'sign1'.tr),
        body: BackgroundContainer(
          padding: const EdgeInsets.all(20),
          child: GetBuilder<LoginControllerImp>(
            builder:
                (controller) => Form(
                  key: controller.formstate,
                  autovalidateMode: controller.autovalidateMode,
                  child: Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 500),
                      child: ListView(
                        children: [
                          LogoAuth(),
                          Customtexttitleauth(text: 'sign2'.tr),
                          const SizedBox(height: 10),
                          Customtextbodyauth(text: 'sign3'.tr),
                          const SizedBox(height: 50),
                          Customtextformauth(
                            valid: (val) {
                              return validateEmail(val!);
                            },
                            labeltext: "sign4".tr,
                            iconData: Icons.email_outlined,
                            mycontroller: controller.email,
                            keyboardType: TextInputType.emailAddress,
                            onSaved:
                                (val) => controller.emailText = val!.trim(),
                          ),
                          const SizedBox(height: 20),
                          GetBuilder<LoginControllerImp>(
                            // الاولاني الي فوق controllerوتستخدم  GetBuilder جرب تشيل
                            builder:
                                (controller) => Customtextformauth(
                                  valid: (val) {
                                    return validatePassword(val!);
                                  },
                                  labeltext: "sign5".tr,
                                  iconData:
                                      controller.isPasswordHidden
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined,
                                  mycontroller: controller.password,
                                  obscureText: controller.isPasswordHidden,
                                  suffixIconOnTap: () {
                                    controller.showPassword();
                                  },
                                ),
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
                          Custombuttomauth(
                            text: 'sign7'.tr,
                            onPressed: () {
                              controller.login();
                            },
                          ),
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
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
