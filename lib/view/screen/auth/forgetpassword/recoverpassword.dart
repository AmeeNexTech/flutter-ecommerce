import '../../../../controller/auth/forgetpassword/recoverpassword_controller.dart';
import '../../../../core/constant/background_container.dart';
import '../../../../core/utils/app_logger.dart';
import '../../../../core/utils/validation_utils.dart';
import '../../../widget/auth/customappbarauthandback.dart';
import '../../../widget/auth/custombuttomauth.dart';
import '../../../widget/auth/customtextbodyauth.dart';
import '../../../widget/auth/customtextformauth.dart';
import '../../../widget/auth/customtextroutto.dart';
import '../../../widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecoverPassword extends StatelessWidget {
  const RecoverPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final RecoverPasswordControllerImp controller =
        Get.find<RecoverPasswordControllerImp>();

    final screenSize = MediaQuery.of(context).size;
    final isLandscape = screenSize.width > screenSize.height;
    final isTablet = screenSize.width > 600;

    return Scaffold(
      appBar: Customappbarauthandback(text: 'recover_password'.tr),
      body: BackgroundContainer(
        padding: EdgeInsets.all(isLandscape ? 16 : 20),
        child: Form(
          key: controller.formstate,
          autovalidateMode: AutovalidateMode.disabled,
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: isTablet ? 600 : 500),
              child: ListView(
                children: [
                  SizedBox(height: isLandscape ? 20 : 40),
                  Customtexttitleauth(text: 'recover_password_subtitle'.tr),
                  SizedBox(height: isLandscape ? 6 : 8),
                  Customtextbodyauth(text: 'recover_password_instruction'.tr),
                  SizedBox(height: isLandscape ? 20 : 30),
                  Customtextformauth(
                    valid: (val) {
                      return validateEmail(val!);
                    },
                    labeltext: 'email'.tr,
                    iconData: Icons.email_outlined,
                    mycontroller: controller.email,
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (val) => controller.emailText = val!.trim(),
                  ),
                  SizedBox(height: isLandscape ? 30 : 40),
                  Obx(() {
                    final loading = controller.isLoading.value;
                    return Custombuttomauth(
                      text: 'send_code'.tr,
                      onPressed:
                          loading
                              ? null
                              : () {
                                AppLogger.i('Send code button pressed');
                                controller.validateEmail();
                              },
                      isLoading: loading,
                      loadingText: 'Send_Code'.tr,
                    );
                  }),
                  SizedBox(height: isLandscape ? 16 : 20),
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
          ),
        ),
      ),
    );
  }
}
