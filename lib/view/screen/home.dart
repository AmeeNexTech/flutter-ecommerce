import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeControllerImp>();
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: FutureBuilder<String>(
          future: controller.getdata(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(); // جاري التحميل
            } else if (snapshot.hasError) {
              return Text('خطأ: ${snapshot.error}');
            } else if (!snapshot.hasData) {
              return const Text('لا توجد بيانات');
            } else {
              return Text(snapshot.data!); // عرض رسالة الترحيب
            }
          },
        ),
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
            btnOkOnPress: () {},
            btnCancelOnPress: () {},
          ).show();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
