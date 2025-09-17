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

/*
💪 Keep Going — You’re on the Right Track!

✅ You’ve built a clean architecture & full Auth — that’s a solid foundation.
📚 Always pause to ask: “What’s the best practice here?” — then apply it.
⚡ Don’t chase perfection, just keep improving each step.
🧠 Focus on building the MVP first — keep it simple and clean.
🧩 Let GetX serve you (state, routes, DI) — not slow you down.
🚀 Build essential APIs, then connect the UI piece by piece.
💡 Reminder: Always search for best practices, apply them, and keep going. 🚀

Every small step is real progress.
Stay consistent, stay curious — you’ve got this. 🌟
*/

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
      defaultTransition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
      getPages: AppPages.pages,
      initialRoute: '/',
    );
  }
}
