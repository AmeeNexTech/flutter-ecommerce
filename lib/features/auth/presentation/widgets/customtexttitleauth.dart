import 'package:flutter/material.dart';

class Customtexttitleauth extends StatelessWidget {
  final String text;
  const Customtexttitleauth({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineLarge,
      textAlign: TextAlign.center,
    );
  }
}
