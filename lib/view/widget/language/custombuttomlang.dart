import 'package:ecommerceshoporia/core/constant/color.dart';
import 'package:flutter/material.dart';

class Custombuttomlang extends StatelessWidget {
  final String textbutton;
  final void Function()? onPressed;

  const Custombuttomlang({super.key, required this.textbutton, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: AppColor.primaryColor, width: 2),
        foregroundColor: AppColor.primaryColor,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        backgroundColor: Colors.white.withOpacity(0.05),
        elevation: 0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.language, size: 20),
          const SizedBox(width: 10),
          Text(
            textbutton,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.1,
            ),
          ),
        ],
      ),
    );
  }
}
