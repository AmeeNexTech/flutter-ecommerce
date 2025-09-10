import '../../controllers/forgetpassword/resetpassword_controller.dart';
import '../../../../../core/constant/background_container.dart';
import '../../../../../core/constant/color.dart';
import '../../../../../routes/app_routes.dart';
import '../../../../../core/utils/validation_utils.dart';
import '../../widgets/custombuttomauth.dart';
import '../../widgets/customtextbodyauth.dart';
import '../../widgets/customtextformauth.dart';
import '../../widgets/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final ResetPasswordControllerImp controller =
        Get.find<ResetPasswordControllerImp>();

    final screenSize = MediaQuery.of(context).size;
    final isLandscape = screenSize.width > screenSize.height;
    final isTablet = screenSize.width > 600;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text(
          'reset_password'.tr,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: AppColor.grey,
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          color: AppColor.grey,
          onPressed: () {
            Get.offAllNamed(AppRoute.login);
          },
        ),
      ),
      // When used, it steps backward and the interface behind it has been removed, so it is not suitable for use.
      //  Customappbarauthandback(text: 'reset_password'.tr),
      body: BackgroundContainer(
        padding: EdgeInsets.all(isLandscape ? 16 : 20),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: isTablet ? 600 : 500),
            child: Form(
              key: controller.formstate,
              autovalidateMode: controller.autovalidateMode,
              child: ListView(
                children: [
                  SizedBox(height: isLandscape ? 20 : 40),
                  Customtexttitleauth(text: 'reset_password_title'.tr),
                  SizedBox(height: isLandscape ? 6 : 8),
                  Customtextbodyauth(text: 'reset_password_instruction'.tr),
                  SizedBox(height: isLandscape ? 20 : 30),
                  GetBuilder<ResetPasswordControllerImp>(
                    builder:
                        (controller) => Customtextformauth(
                          valid: (val) => validatePassword(val!),
                          labeltext: 'enter_password'.tr,
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
                  SizedBox(height: isLandscape ? 16 : 20),
                  GetBuilder<ResetPasswordControllerImp>(
                    builder:
                        (controller) => Customtextformauth(
                          valid:
                              (val) => validateConfirmPassword(
                                val!,
                                controller.password.text,
                              ),
                          labeltext: 'confirm_password'.tr,
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
                  SizedBox(height: isLandscape ? 30 : 40),
                  Obx(() {
                    final loading = controller.isLoading.value;
                    return Custombuttomauth(
                      text: 'save'.tr,
                      onPressed:
                          loading ? null : () => controller.resetPassword(),
                      isLoading: loading,
                      loadingText: 'save'.tr,
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
