import 'package:ecommerceshoporia/core/constant/routes.dart';
import 'package:ecommerceshoporia/view/screen/auth/login.dart';
import 'package:ecommerceshoporia/view/screen/onboarding.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoute.login: (context) => Login(),
  AppRoute.onboarding: (context) => OnBoarding(),
};
