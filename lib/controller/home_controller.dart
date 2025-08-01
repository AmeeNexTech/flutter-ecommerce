import 'package:get/get.dart';

import '../core/constant/routes.dart';
import '../core/services/storage/token_service.dart';

abstract class HomeController extends GetxController {
  getdata();
  logout();
  deleteAccount();
}

class HomeControllerImp extends HomeController {
  final TokenService _tokenService = Get.find<TokenService>();

  @override
  void onInit() {
    super.onInit();
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    // التحقق من التوكن عند فتح الصفحة
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
  logout() {
    // Implement logout logic here
    Get.offAllNamed(AppRoute.login);
  }

  @override
  deleteAccount() {
    // Implement account deletion logic here
    Get.offAllNamed(AppRoute.signUp);
  }
}
