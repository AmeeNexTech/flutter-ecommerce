import 'package:get/get.dart';

import 'controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // تسجيل Controllers العامة
    Get.lazyPut<HomeControllerImp>(() => HomeControllerImp());
  }
}
