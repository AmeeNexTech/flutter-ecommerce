import 'package:ecommerceshoporia/core/constant/routes.dart';
import 'package:ecommerceshoporia/core/services/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AppMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString('onBoarding') == "1") {
      return const RouteSettings(name: AppRoute.login);
    } else
      return null;
  }
}
