import 'color.dart';
import 'package:flutter/material.dart';

class BackgroundContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const BackgroundContainer({super.key, required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColor.backgroundcolor, AppColor.backgroundcolor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: child,
    );
  }
}
