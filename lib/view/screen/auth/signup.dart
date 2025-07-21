import '../../../controller/auth/signup_controller.dart';
import '../../../core/constant/background_container.dart';
import '../../../core/utils/alertexitapp.dart';
import '../../../core/utils/app_logger.dart';
import '../../../core/utils/validation_utils.dart';
import '../../widget/auth/customappbarauth.dart';
import '../../widget/auth/custombuttomauth.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/customtextroutto.dart';
import '../../widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isLandscape = screenSize.width > screenSize.height;
    final isTablet = screenSize.width > 600;

    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (!didPop) {
          final bool exit = await alertExitApp();
          if (exit) Get.back();
        }
      },
      child: Scaffold(
        appBar: Customappbarauth(text: 'signUp'.tr),
        body: BackgroundContainer(
          padding: EdgeInsets.all(isLandscape ? 16 : 20),
          child: GetBuilder<SignupControllerImp>(
            builder:
                (controller) => Form(
                  key: controller.formKey,
                  autovalidateMode: controller.autovalidateMode,
                  child: Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: isTablet ? 600 : 500,
                      ),
                      child: ListView(
                        children: [
                          SizedBox(height: isLandscape ? 20 : 40),
                          Customtexttitleauth(text: 'signUp1'.tr),
                          SizedBox(height: isLandscape ? 8 : 10),
                          Customtextbodyauth(text: 'signUp2'.tr),
                          SizedBox(height: isLandscape ? 30 : 50),
                          Customtextformauth(
                            valid: (val) {
                              return validateUsername(val!);
                            },
                            labeltext: 'fieldUsername'.tr,
                            mycontroller: controller.username,
                            iconData: Icons.person_outline,
                            keyboardType: TextInputType.name,
                            onSaved:
                                (val) => controller.username.text = val!.trim(),
                          ),
                          SizedBox(height: isLandscape ? 16 : 20),
                          Customtextformauth(
                            valid: (val) {
                              return validateEmail(val!);
                            },
                            labeltext: 'fieldEmail'.tr,
                            mycontroller: controller.email,
                            iconData: Icons.email_outlined,
                            keyboardType: TextInputType.emailAddress,
                            onSaved:
                                (val) => controller.email.text = val!.trim(),
                          ),
                          SizedBox(height: isLandscape ? 16 : 20),
                          Customtextformauth(
                            valid: (val) {
                              return validatePhone(val!);
                            },
                            labeltext: 'fieldPhone'.tr,
                            mycontroller: controller.phone,
                            iconData: Icons.phone_android_outlined,
                            keyboardType: TextInputType.phone,
                            onSaved:
                                (val) => controller.phone.text = val!.trim(),
                          ),
                          SizedBox(height: isLandscape ? 16 : 20),
                          Customtextformauth(
                            valid: (val) {
                              return validatePassword(val!);
                            },
                            mycontroller: controller.password,
                            labeltext: 'fieldPassword'.tr,
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
                                (val) => controller.password.text = val!.trim(),
                          ),
                          SizedBox(height: isLandscape ? 30 : 40),
                          Obx(
                            () => Custombuttomauth(
                              text: 'signUp3'.tr,
                              onPressed:
                                  controller.isLoading.value
                                      ? null
                                      : () {
                                        AppLogger.i('Sign Up button pressed');
                                        controller.signup();
                                      },
                              isLoading: controller.isLoading.value,
                              loadingText: 'signUp3'.tr,
                            ),
                          ),

                          SizedBox(height: isLandscape ? 20 : 30),
                          CustomTextroutto(
                            text: 'signUp4'.tr,
                            textButton: 'signUp5'.tr,
                            onPressed: controller.goToLogin,
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
