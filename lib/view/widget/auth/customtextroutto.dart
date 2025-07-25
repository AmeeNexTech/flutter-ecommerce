import '../../../core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomTextroutto extends StatelessWidget {
  final String text;
  final String textButton;
  final void Function()? onPressed;
  const CustomTextroutto({
    super.key,
    required this.text,
    this.textButton = '',
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(
            color: AppColor.grey,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            textButton,
            style: const TextStyle(
              color: AppColor.primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
