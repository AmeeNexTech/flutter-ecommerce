import 'package:ecommerceshoporia/core/constant/routes.dart';
import 'package:ecommerceshoporia/view/screen/auth/recoverpassword.dart';
import 'package:ecommerceshoporia/view/screen/auth/login.dart';
import 'package:ecommerceshoporia/view/screen/auth/resetpassword.dart';
import 'package:ecommerceshoporia/view/screen/auth/signup.dart';
import 'package:ecommerceshoporia/view/screen/auth/success_resetpassword.dart';
import 'package:ecommerceshoporia/view/screen/auth/verifycode.dart';
import 'package:ecommerceshoporia/view/screen/onboarding.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoute.login: (context) => Login(),
  AppRoute.signUp: (context) => SignUp(),
  AppRoute.recoverpassword: (context) => RecoverPassword(),
  AppRoute.verifycode: (context) => VerifyCode(),
  AppRoute.resetpassword: (context) => ResetPassword(),
  AppRoute.successresetpassword: (context) => SuccessResetPassword(),
  AppRoute.onboarding: (context) => OnBoarding(),
};
