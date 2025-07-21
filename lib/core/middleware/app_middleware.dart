import '../constant/routes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../services/storage/local_storage_service.dart';

class AppMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  LocalStorageService localStorageService = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (localStorageService.sharedPreferences.getString('onBoarding') == '1') {
      return const RouteSettings(name: AppRoute.login);
    } else {
      return null;
    }
  }
}
