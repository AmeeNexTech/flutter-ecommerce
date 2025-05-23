import 'package:ecommerceshoporia/core/middleware/app_middleware.dart';
import 'package:get/get.dart';
import 'package:ecommerceshoporia/core/constant/routes.dart';

import 'package:ecommerceshoporia/view/screen/auth/login.dart';
import 'package:ecommerceshoporia/view/screen/auth/signup.dart';
import 'package:ecommerceshoporia/view/screen/auth/forgetpassword/recoverpassword.dart';
import 'package:ecommerceshoporia/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:ecommerceshoporia/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommerceshoporia/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:ecommerceshoporia/view/screen/auth/verifyemail.dart';
import 'package:ecommerceshoporia/view/screen/auth/success_signup.dart';
import 'package:ecommerceshoporia/view/screen/onboarding.dart';
import 'package:ecommerceshoporia/view/screen/language.dart';

import 'package:ecommerceshoporia/bindings/login_binding.dart';
import 'package:ecommerceshoporia/bindings/verifycode_binding.dart';
import 'package:ecommerceshoporia/bindings/resetpassword_binding.dart';
import 'package:ecommerceshoporia/bindings/verifyemail_binding.dart';
import 'package:ecommerceshoporia/bindings/language_binding.dart';
import 'package:ecommerceshoporia/bindings/onboarding_binding.dart';
import 'package:ecommerceshoporia/bindings/recoverpassword_binding.dart';
import 'package:ecommerceshoporia/bindings/signup_binding.dart';
import 'package:ecommerceshoporia/bindings/success_reset_password_binding.dart';
import 'package:ecommerceshoporia/bindings/success_signup_bindings.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: "/",
      page: () => const Language(),
      binding: LanguageBinding(),
      middlewares: [AppMiddleware()],
    ),

    GetPage(
      name: AppRoute.onboarding,
      page: () => const OnBoarding(),
      binding: OnboardingBinding(),
    ),

    GetPage(
      name: AppRoute.login,
      page: () => const Login(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoute.signUp,
      page: () => const SignUp(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: AppRoute.recoverpassword,
      page: () => const RecoverPassword(),
      binding: RecoverpasswordBinding(),
    ),
    GetPage(
      name: AppRoute.verifycode,
      page: () => const VerifyCode(),
      binding: VerifyCodeBinding(),
    ),
    GetPage(
      name: AppRoute.resetpassword,
      page: () => const ResetPassword(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: AppRoute.successresetpassword,
      page: () => const SuccessResetPassword(),
      binding: SuccessResetPasswordBinding(),
    ),
    GetPage(
      name: AppRoute.verifyemail,
      page: () => const VerifyEmail(),
      binding: VerifyEmailBinding(),
    ),
    GetPage(
      name: AppRoute.successverifyemail,
      page: () => const SuccessVerifyEmail(),
      binding: SuccessSignupBinding(),
    ),
  ];
}
