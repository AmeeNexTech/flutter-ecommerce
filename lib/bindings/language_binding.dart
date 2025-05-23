import 'package:get/get.dart';
import 'package:ecommerceshoporia/core/localization/changelocal.dart';

class LanguageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocaleController>(() => LocaleController());
  }
}
