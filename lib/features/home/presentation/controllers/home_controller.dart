import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_routes.dart';
import '../../../../core/services/storage/token_service.dart';
import '../../../../core/utils/app_logger.dart';
import '../../../../core/utils/snackbar_util.dart';
import '../../../auth/domain/entities/user_model.dart';
import '../../../auth/domain/usecases/delete_account_usecase.dart';
import '../../../auth/domain/usecases/logout_usecase.dart';

abstract class HomeController extends GetxController {
  Future<UserModel?> getdata();
  logout();
  deleteAccount();
}

class HomeControllerImp extends HomeController {
  final TokenService _tokenService = Get.find<TokenService>();
  final LogoutUseCase _logoutUseCase = Get.find<LogoutUseCase>();
  final DeleteAccountUseCase _deleteAccountUseCase =
      Get.find<DeleteAccountUseCase>();

  final passwordController = TextEditingController();
  final deleteAccountFormKey = GlobalKey<FormState>();

  final isLoading = false.obs;
  final currentOperation = ''.obs;

  // عند بدء التشغيل، تحقق من حالة المصادقة
  // حاليا لا اتحقق لان المنطق البيزنز ان اجعله يتسوق دون ان اجبره علي التسجيل
  /*
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
*/
  @override
  Future<UserModel?> getdata() async {
    try {
      final user = await _tokenService.getUser();
      if (user == null) {
        return null;
      }

      return user;
    } catch (e) {
      AppLogger.e('Error loading user: $e');
      return null;
    }
  }

  @override
  void logout() async {
    currentOperation.value = 'logout';
    isLoading.value = true;

    final result = await _logoutUseCase();
    // لا يهم إذا نجحت العملية أو فشلت، سنقوم بتسجيل خروج المستخدم محليًا
    await _tokenService.deleteToken();
    Get.toNamed(AppRoute.login);

    isLoading.value = false;

    result.fold(
      (failure) {
        // يمكن عرض الخطأ، لكن المستخدم تم تسجيل خروجه بالفعل
        // showErrorSnackbar(message: failure.message);
      },
      (response) {
        showSuccessSnackbar(message: response.message);
      },
    );
  }

  @override
  void deleteAccount() async {
    if (!deleteAccountFormKey.currentState!.validate()) {
      return;
    }
    currentOperation.value = 'delete';
    isLoading.value = true;

    final result = await _deleteAccountUseCase(
      DeleteAccountParams(password: passwordController.text.trim()),
    );
    isLoading.value = false;
    passwordController.clear();

    result.fold(
      (failure) {
        showErrorSnackbar(message: failure.message);
      },
      (response) async {
        await _tokenService.deleteToken();
        showSuccessSnackbar(message: response.message);
        Get.toNamed(AppRoute.login);
      },
    );
  }

  @override
  void onClose() {
    passwordController.dispose();
    super.onClose();
  }
}
