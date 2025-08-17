import 'package:flutter/material.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomOtpField extends StatelessWidget {
  final TextEditingController controller;
  final StreamController<ErrorAnimationType>? errorController;
  final Function(String)? onCompleted;
  final RxBool hasError;

  const CustomOtpField({
    super.key,
    required this.controller,
    required this.errorController,
    required this.onCompleted,
    required this.hasError,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PinCodeTextField(
          appContext: context,
          length: 6,
          controller: controller,
          keyboardType: TextInputType.number,
          animationType: AnimationType.fade,
          enableActiveFill: true,
          onChanged: (value) {},
          onCompleted: onCompleted,
          errorAnimationController: errorController,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(12),
            fieldHeight: 55,
            fieldWidth: 45,
            activeFillColor: Colors.white,
            selectedFillColor: Colors.white,
            inactiveFillColor: Colors.white,
            activeColor: Colors.blue,
            selectedColor: Colors.blueAccent,
            inactiveColor: Colors.grey,
          ),
        ),
        const SizedBox(height: 10),
        Obx(
          () =>
              hasError.value
                  ? const Text(
                    'Please enter a valid 6-digit code',
                    style: TextStyle(color: Colors.red, fontSize: 13),
                  )
                  : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
