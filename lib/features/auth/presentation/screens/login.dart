import '../controllers/login_controller.dart';
import '../../../../core/constant/background_container.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/utils/alertexitapp.dart';
import '../../../../core/utils/app_logger.dart';
import '../../../../core/utils/validation_utils.dart';
import '../widgets/customappbarauth.dart';
import '../widgets/custombuttomauth.dart';
import '../widgets/customtextbodyauth.dart';
import '../widgets/customtextformauth.dart';
import '../widgets/customtextroutto.dart';
import '../widgets/customtexttitleauth.dart';
import '../widgets/logoauth.dart';
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
        appBar: Customappbarauth(text: 'sign1'.tr),
        body: BackgroundContainer(
          padding: EdgeInsets.all(isLandscape ? 16 : 20),
          child: GetBuilder<LoginControllerImp>(
            builder:
                (controller) => Form(
                  key: controller.formstate,
                  autovalidateMode: controller.autovalidateMode,
                  child: Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: isTablet ? 600 : 500,
                      ),
                      child: ListView(
                        children: [
                          SizedBox(height: isLandscape ? 20 : 40),
                          const LogoAuth(),
                          Customtexttitleauth(text: 'sign2'.tr),
                          SizedBox(height: isLandscape ? 8 : 10),
                          Customtextbodyauth(text: 'sign3'.tr),
                          SizedBox(height: isLandscape ? 30 : 50),
                          Customtextformauth(
                            valid: (val) {
                              return validateEmail(val!);
                            },
                            labeltext: 'sign4'.tr,
                            iconData: Icons.email_outlined,
                            mycontroller: controller.email,
                            keyboardType: TextInputType.emailAddress,
                            onSaved:
                                (val) => controller.emailText = val!.trim(),
                          ),
                          SizedBox(height: isLandscape ? 16 : 20),
                          GetBuilder<LoginControllerImp>(
                            builder:
                                (controller) => Customtextformauth(
                                  valid: (val) {
                                    return validatePassword(val!);
                                  },
                                  labeltext: 'sign5'.tr,
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
                                'sign6'.tr,
                                style: const TextStyle(
                                  color: AppColor.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: isLandscape ? 16 : 20),
                          Obx(() {
                            final loading = controller.isLoading.value;
                            return Custombuttomauth(
                              text: 'sign7'.tr,
                              onPressed:
                                  loading
                                      ? null
                                      : () {
                                        AppLogger.i('Login button pressed');
                                        controller.login();
                                      },
                              isLoading: loading,
                              loadingText: 'sign7'.tr,
                            );
                          }),

                          SizedBox(height: isLandscape ? 20 : 30),
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
