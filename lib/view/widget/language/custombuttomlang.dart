import 'package:ecommerceshoporia/core/constant/color.dart';
import 'package:flutter/material.dart';

class Custombuttomlang extends StatelessWidget {
  final String textbutton;
  final void Function()? onPressed;

  const Custombuttomlang({Key? key, required this.textbutton, this.onPressed})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: AppColor.primaryColor,
      textColor: Colors.white,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.language, color: Colors.white),
          const SizedBox(width: 12),
          Text(
            textbutton,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
