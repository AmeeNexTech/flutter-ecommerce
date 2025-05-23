import 'package:ecommerceshoporia/core/constant/apptheme.dart';
import 'package:ecommerceshoporia/core/localization/changelocal.dart';
import 'package:ecommerceshoporia/core/localization/translation.dart';
import 'package:ecommerceshoporia/core/services/services.dart';
import 'package:ecommerceshoporia/routes/app_pages.dart';
import 'package:ecommerceshoporia/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController(), permanent: true);
    return GetMaterialApp(
      translations: MyTranslation(),
      locale: controller.language,
      fallbackLocale: Locale('en'),
      debugShowCheckedModeBanner: false,
      theme: appTheme(controller.language?.languageCode),
      getPages: AppPages.pages,
      initialRoute: "/",
    );
  }
}
