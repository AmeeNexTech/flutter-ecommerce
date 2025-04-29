import 'dart:ui';

import 'package:ecommerceshoporia/core/services/services.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  Locale? language;
  MyServices myServices = Get.find();

  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    language = locale;
    Get.updateLocale(locale);
    update();
  }

  @override
  void onInit() {
    String? shardPrefLang = myServices.sharedPreferences.getString("lang");
    if (shardPrefLang == "ar") {
      language = const Locale("ar");
    } else if (shardPrefLang == "en") {
      language = const Locale("en");
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      myServices.sharedPreferences.setString(
        "lang",
        Get.deviceLocale!.languageCode,
      );
    }
    super.onInit();
  }
}
