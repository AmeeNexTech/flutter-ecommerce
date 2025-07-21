import 'package:flutter/material.dart';
import 'package:get/get.dart';

void _showSnackbar({
  required String title,
  required String message,
  required Color backgroundColor,
  required IconData icon,
  required Duration duration,
}) {
  Get.snackbar(
    title,
    message,
    backgroundColor: backgroundColor,
    colorText: Colors.white,
    snackPosition: SnackPosition.TOP,
    icon: Icon(icon, color: Colors.white),
    duration: duration,
    margin: const EdgeInsets.all(12),
    borderRadius: 10,
  );
}

void showSuccessSnackbar({required String title, required String message}) {
  _showSnackbar(
    title: title,
    message: message,
    backgroundColor: Colors.green,
    icon: Icons.check_circle,
    duration: const Duration(seconds: 2),
  );
}

void showErrorSnackbar({required String title, required String message}) {
  _showSnackbar(
    title: title,
    message: message,
    backgroundColor: Colors.red,
    icon: Icons.error,
    duration: const Duration(seconds: 3),
  );
}

void showInfoSnackbar({required String title, required String message}) {
  _showSnackbar(
    title: title,
    message: message,
    backgroundColor: Colors.blue,
    icon: Icons.info,
    duration: const Duration(seconds: 2),
  );
}
