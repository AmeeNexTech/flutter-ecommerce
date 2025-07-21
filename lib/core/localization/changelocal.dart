import 'dart:ui';

import 'package:get/get.dart';
import '../services/storage/local_storage_service.dart';

class LocaleController extends GetxController {
  Locale? language;
  LocalStorageService localStorageService = Get.find();

  changeLang(String langcode) {
    final Locale locale = Locale(langcode);
    localStorageService.sharedPreferences.setString('lang', langcode);
    language = locale;
    Get.updateLocale(locale);
    update();
  }

  @override
  void onInit() {
    final String? shardPrefLang = localStorageService.sharedPreferences
        .getString('lang');
    if (shardPrefLang == 'ar') {
      language = const Locale('ar');
    } else if (shardPrefLang == 'en') {
      language = const Locale('en');
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      localStorageService.sharedPreferences.setString(
        'lang',
        Get.deviceLocale!.languageCode,
      );
    }
    super.onInit();
  }
}
