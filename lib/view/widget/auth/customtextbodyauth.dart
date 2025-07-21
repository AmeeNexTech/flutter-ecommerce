import '../../../core/constant/color.dart';
import 'package:flutter/material.dart';

class Customtextbodyauth extends StatelessWidget {
  final String text;
  const Customtextbodyauth({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: Text(
        text,
        textAlign: TextAlign.center,

        style: Theme.of(
          context,
        ).textTheme.bodyLarge?.copyWith(color: AppColor.grey, fontSize: 16),
      ),
    );
  }
}
