import 'package:ecommerceshoporia/core/localization/changelocal.dart';
import 'package:ecommerceshoporia/core/localization/translation.dart';
import 'package:ecommerceshoporia/core/services/services.dart';
import 'package:ecommerceshoporia/routes.dart';
import 'package:ecommerceshoporia/firebase_options.dart';
import 'package:ecommerceshoporia/test.dart';
import 'package:ecommerceshoporia/view/screen/language.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ecommerceshoporia/core/constant/color.dart';

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
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      locale: controller.language,
      fallbackLocale: Locale('en'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily:
            controller.language?.languageCode == "ar" ? "Cairo" : "Poppins",

        textTheme: TextTheme(
          headlineLarge: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w800,
            color: Colors.black87,
            letterSpacing: 0.5,
          ),
          headlineMedium: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
          bodyLarge: TextStyle(
            fontSize: 18,
            color: AppColor.grey,
            fontWeight: FontWeight.w500,
            height: 1.6,
            letterSpacing: 0.3,
          ),
        ),
      ),
      home: const Language(),
      routes: routes,
    );
  }
}
