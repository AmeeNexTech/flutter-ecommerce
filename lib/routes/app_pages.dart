import '../bindings/app_binding.dart';
import '../bindings/auth_binding.dart';
import '../core/middleware/app_middleware.dart';
import 'package:get/get.dart';
import '../core/constant/routes.dart';

import '../view/screen/auth/login.dart';
import '../view/screen/auth/signup.dart';
import '../view/screen/auth/forgetpassword/recoverpassword.dart';
import '../view/screen/auth/forgetpassword/verifycode.dart';
import '../view/screen/auth/forgetpassword/resetpassword.dart';
import '../view/screen/auth/forgetpassword/success_resetpassword.dart';
import '../view/screen/auth/verifyemail.dart';
import '../view/screen/auth/success_signup.dart';
import '../view/screen/onboarding.dart';
import '../view/screen/language.dart';

class AppPages {
  static final pages = [
    // الصفحات العامة
    GetPage(
      name: '/',
      page: () => const Language(),
      binding: AppBinding(),
      middlewares: [AppMiddleware()],
    ),

    GetPage(
      name: AppRoute.onboarding,
      page: () => const OnBoarding(),
      binding: AppBinding(),
    ),

    // صفحات المصادقة
    GetPage(
      name: AppRoute.login,
      page: () => const Login(),
      binding: AuthBinding(),
    ),

    GetPage(
      name: AppRoute.signUp,
      page: () => const SignUp(),
      binding: AuthBinding(),
    ),

    GetPage(
      name: AppRoute.verifyemail,
      page: () => const VerifyEmail(),
      binding: AuthBinding(),
    ),

    GetPage(
      name: AppRoute.recoverpassword,
      page: () => const RecoverPassword(),
      binding: AuthBinding(),
    ),

    GetPage(
      name: AppRoute.verifycode,
      page: () => const VerifyCode(),
      binding: AuthBinding(),
    ),

    GetPage(
      name: AppRoute.resetpassword,
      page: () => const ResetPassword(),
      binding: AuthBinding(),
    ),

    GetPage(
      name: AppRoute.successresetpassword,
      page: () => const SuccessResetPassword(),
      binding: AuthBinding(),
    ),

    GetPage(
      name: AppRoute.successverifyemail,
      page: () => const SuccessVerifyEmail(),
      binding: AuthBinding(),
    ),
  ];
}
