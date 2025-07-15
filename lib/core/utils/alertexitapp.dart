import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

Future<bool> alertExitApp() async {
  final completer = Completer<bool>();

  AwesomeDialog(
    context: Get.context!,
    dialogType: DialogType.noHeader,
    animType: AnimType.scale,
    dialogBackgroundColor: Colors.white,
    dismissOnTouchOutside: false,
    headerAnimationLoop: false,
    padding: const EdgeInsets.all(20),
    dialogBorderRadius: BorderRadius.circular(25),

    title: 'exit_title'.tr,
    titleTextStyle: const TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    ),

    desc: 'exit_desc'.tr,
    descTextStyle: const TextStyle(fontSize: 16, color: Colors.black54),

    // زر إلغاء
    btnCancel: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey.shade300,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
        elevation: 5,
        shadowColor: Colors.black26,
      ),
      onPressed: () {
        if (!completer.isCompleted) completer.complete(false);
        Navigator.of(Get.context!).pop();
      },
      child: Text(
        'exit_no'.tr,
        style: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    ),

    btnOk: InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () {
        if (!completer.isCompleted) completer.complete(true);
        Navigator.of(Get.context!).pop();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            colors: [Color(0xFF007BFF), Color(0xFF00C6FF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.5),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Text(
          'exit_yes'.tr,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    ),
  ).show();

  return completer.future;
}
