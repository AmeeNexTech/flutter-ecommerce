import 'package:get/get.dart';

import '../../../../core/constant/color.dart';
import 'package:flutter/material.dart';

class Customappbarauthandback extends StatelessWidget
    implements PreferredSizeWidget {
  final String text;
  const Customappbarauthandback({super.key, required this.text});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: AppColor.backgroundcolor,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      elevation: 0.0,
      title: Text(
        text,
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
          color: AppColor.grey,
          fontSize: 20,
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new),
        color: AppColor.grey,
        onPressed: () {
          Get.back();
        },
      ),
    );
  }
}
