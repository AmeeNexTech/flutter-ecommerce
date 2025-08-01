import '../../../../core/constant/background_container.dart';
import '../../../widget/auth/customappbarauth.dart';
import '../../../widget/auth/customtextbodyauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/auth/forgetpassword/success_reset_password_controller.dart';

class SuccessResetPassword extends StatefulWidget {
  const SuccessResetPassword({super.key});

  @override
  State<SuccessResetPassword> createState() => _SuccessResetPasswordState();
}

class _SuccessResetPasswordState extends State<SuccessResetPassword>
    with TickerProviderStateMixin {
  late SuccessResetPasswordController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<SuccessResetPasswordController>();
    controller.init(this);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isLandscape = screenSize.width > screenSize.height;
    final isTablet = screenSize.width > 600;

    return Scaffold(
      appBar: Customappbarauth(text: 'success'.tr),
      body: BackgroundContainer(
        padding: EdgeInsets.all(isLandscape ? 16 : 20),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: isTablet ? 600 : 500),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ScaleTransition(
                  scale: controller.scaleAnimation,
                  child: Icon(
                    Icons.check_circle,
                    size: isLandscape ? 100 : 120,
                    color: Colors.blue.shade600,
                    shadows: [
                      Shadow(color: Colors.green.shade200, blurRadius: 15),
                    ],
                  ),
                ),
                SizedBox(height: isLandscape ? 20 : 30),
                Text(
                  'password_reset_successful'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: isLandscape ? 20 : 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: isLandscape ? 8 : 10),
                Customtextbodyauth(text: 'go_to_login'.tr),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
