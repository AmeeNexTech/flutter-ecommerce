import '../../../core/constant/color.dart';
import 'package:flutter/material.dart';

class Customtextformauth extends StatelessWidget {
  final String? labeltext;
  final IconData? iconData;
  final TextEditingController? mycontroller;
  final String? Function(String?)? valid;
  final void Function(String?)? onSaved;
  final TextInputType keyboardType;
  final bool obscureText;
  final VoidCallback? suffixIconOnTap;

  const Customtextformauth({
    super.key,
    required this.labeltext,
    required this.iconData,
    required this.mycontroller,
    required this.valid,
    this.keyboardType = TextInputType.text,
    this.onSaved,
    this.obscureText = false,
    this.suffixIconOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: valid,
      controller: mycontroller,
      onSaved: onSaved,
      keyboardType: keyboardType,
      obscureText: obscureText,
      cursorColor: AppColor.primaryColor,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        isDense: true,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        labelText: labeltext,
        labelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: AppColor.grey.withAlpha(204),
          fontSize: 16,
          height: 1.3,
          fontWeight: FontWeight.w500,
        ),
        suffixIcon: IconButton(
          onPressed: suffixIconOnTap,
          icon: Icon(iconData, color: AppColor.grey.withAlpha(178), size: 22),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColor.grey.withAlpha(127),
            width: 1.2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColor.primaryColor,
            width: 2.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 2.0),
        ),
      ),
    );
  }
}
