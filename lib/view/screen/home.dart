import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../controller/home_controller.dart';
import '../../core/constant/color.dart';
import '../../core/constant/imageasset.dart';
import '../../core/utils/validation_utils.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeControllerImp>();
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Stack(
        children: [
          // المحتوى الأساسي
          Center(
            child: FutureBuilder<String>(
              future: controller.getdata(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('خطأ: ${snapshot.error}');
                } else if (!snapshot.hasData) {
                  return const Text('لا توجد بيانات');
                } else {
                  return Text(snapshot.data!);
                }
              },
            ),
          ),

          // Loading Overlay
          Obx(() {
            if (controller.isLoading.value) {
              return Container(
                color: AppColor.backgroundcolor,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        AppImageasset.loading,
                        width: 150,
                        height: 150,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        controller.currentOperation.value == 'logout'
                            ? 'logging out...'
                            : 'deleting account...',
                        style: const TextStyle(
                          color: AppColor.primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return const SizedBox.shrink();
          }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.info,
            animType: AnimType.scale,
            title: 'Hello',
            desc: 'This is a optional logout & delete account dialog.',
            btnOkText: 'Logout',
            btnCancelText: 'Delete Account',
            btnOkOnPress: () {
              controller.logout();
            },
            btnCancelOnPress: () {
              Get.back();
              _showDeleteAccountDialog();
            },
          ).show();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

// دالة عرض دايلوج حذف الحساب
void _showDeleteAccountDialog() {
  final controller = Get.find<HomeControllerImp>();

  Get.dialog(
    AlertDialog(
      title: const Text('Delete Account'),
      content: Form(
        key: controller.deleteAccountFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'This action cannot be undone. Your account will be permanently deleted.',
              style: TextStyle(color: Colors.red),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: controller.passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
              validator: (val) {
                return validatePassword(val!);
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => Get.back(), child: const Text('Cancel')),
        ElevatedButton(
          onPressed: () {
            Get.back(); // Close the dialog
            controller.deleteAccount(); // Call the delete account function
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
          ),
          child: const Text('Delete Account'),
        ),
      ],
    ),
  );
}
