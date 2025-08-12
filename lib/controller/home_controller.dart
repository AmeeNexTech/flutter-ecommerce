import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/routes.dart';
import '../core/services/storage/token_service.dart';
import '../core/utils/snackbar_util.dart';
import '../data/repository/auth/user_repository.dart';

abstract class HomeController extends GetxController {
  getdata();
  logout();
  deleteAccount();
}

class HomeControllerImp extends HomeController {
  final TokenService _tokenService = Get.find<TokenService>();
  final IUserRepository _userRepository = Get.find<IUserRepository>();

  final passwordController = TextEditingController();
  final deleteAccountFormKey = GlobalKey<FormState>();

  final isLoading = false.obs;
  final currentOperation = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    if (!await _tokenService.hasToken()) {
      Get.offAllNamed(AppRoute.login);
    }
  }

  @override
  Future<String> getdata() async {
    try {
      final user = await _tokenService.getUser();
      if (user == null) {
        return 'No user found';
      }
      final username = user['name'] ?? user['username'] ?? 'Guest';
      return 'Welcome $username';
    } catch (e) {
      return 'Error loading user data';
    }
  }

  @override
  void logout() async {
    try {
      currentOperation.value = 'logout';
      isLoading.value = true;
      final response = await _userRepository.logout();
      await _tokenService.deleteToken();
      showSuccessSnackbar(title: 'success', message: response.message);
      Get.offAllNamed(AppRoute.login);
    } catch (e) {
      if (e.toString().contains('401') ||
          e.toString().contains('Unauthenticated')) {
        await _tokenService.deleteToken();
        Get.offAllNamed(AppRoute.login);
      } else {
        showErrorSnackbar(title: 'خطأ', message: e.toString());
      }
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void deleteAccount() async {
    if (!deleteAccountFormKey.currentState!.validate()) {
      return;
    }
    currentOperation.value = 'delete';
    isLoading.value = true;

    try {
      final response = await _userRepository.deleteAccount(
        password: passwordController.text.trim(),
      );

      await _tokenService.deleteToken();

      showSuccessSnackbar(title: 'success', message: response.message);

      Get.offAllNamed(AppRoute.login);
    } catch (e) {
      if (e.toString().contains('Invalid password')) {
        showErrorSnackbar(title: 'خطأ', message: 'Invalid password');
      } else if (e.toString().contains('401')) {
        await _tokenService.deleteToken();
        Get.offAllNamed(AppRoute.login);
      } else {
        showErrorSnackbar(title: 'خطأ', message: e.toString());
      }
    } finally {
      isLoading.value = false;
      passwordController.clear();
    }
  }

  @override
  void onClose() {
    // ignore: invalid_use_of_protected_member
    deleteAccountFormKey.currentState!.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
