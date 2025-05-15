import 'package:ecommerceshoporia/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomTextroutto extends StatelessWidget {
  final String text;
  final String textButton;
  final void Function()? onPressed;
  const CustomTextroutto({
    super.key,
    required this.text,
    required this.textButton,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
            color: AppColor.grey,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            textButton,
            style: TextStyle(
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
