import '../features/home/presentation/home_binding.dart';
import '../features/initial_flow/presentation/initial_binding.dart';
import '../features/auth/presentation/auth_binding.dart';
import 'package:get/get.dart';
import 'app_routes.dart';

import '../features/auth/presentation/screens/login.dart';
import '../features/auth/presentation/screens/signup.dart';
import '../features/auth/presentation/screens/forgetpassword/recoverpassword.dart';
import '../features/auth/presentation/screens/forgetpassword/verifycode.dart';
import '../features/auth/presentation/screens/forgetpassword/resetpassword.dart';
import '../features/auth/presentation/screens/forgetpassword/success_resetpassword.dart';
import '../features/auth/presentation/screens/verifyemail.dart';
import '../features/auth/presentation/screens/success_signup.dart';
import '../features/home/presentation/screens/home.dart';
import '../features/initial_flow/presentation/screens/onboarding.dart';
import '../features/initial_flow/presentation/screens/language.dart';
import '../features/initial_flow/presentation/screens/splash.dart';

class AppPages {
  static final pages = [
    // Splash Screen
    GetPage(
      name: '/',
      page: () => const SplashScreen(),
      binding: InitialBinding(),
    ),

    // الصفحات العامة
    GetPage(name: AppRoute.language, page: () => const Language()),

    GetPage(
      name: AppRoute.onboarding,
      page: () => const OnBoarding(),
      binding: InitialBinding(),
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

    GetPage(
      name: AppRoute.home,
      page: () => const Home(),
      binding: HomeBinding(),
    ),
  ];
}
