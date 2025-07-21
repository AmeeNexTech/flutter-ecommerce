import 'core/constant/app_theme.dart';
import 'core/di/app_dependencies.dart';
import 'core/localization/changelocal.dart';
import 'core/localization/translation.dart';
import 'routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppDependencies.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final LocaleController controller = Get.find<LocaleController>();
    return GetMaterialApp(
      translations: MyTranslation(),
      locale: controller.language,
      fallbackLocale: const Locale('en'),
      debugShowCheckedModeBanner: false,
      theme: appTheme(controller.language?.languageCode),
      getPages: AppPages.pages,
      initialRoute: '/',
    );
  }
}
