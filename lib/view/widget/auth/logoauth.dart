import 'package:ecommerceshoporia/core/constant/imageasset.dart';
import 'package:flutter/cupertino.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImageasset.logo,
      width: 150,
      height: 150,
      fit: BoxFit.contain,
    );
  }
}
