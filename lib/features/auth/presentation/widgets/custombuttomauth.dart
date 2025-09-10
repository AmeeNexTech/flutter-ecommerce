import 'package:flutter/material.dart';

class Custombuttomauth extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final bool isLoading;
  final String? loadingText;

  const Custombuttomauth({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.loadingText,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isLoading ? null : onPressed, // تعطيل الزر أثناء التحميل
        borderRadius: BorderRadius.circular(30),
        child: Container(
          width: double.infinity,
          height: 55,
          decoration: BoxDecoration(
            gradient:
                isLoading
                    ? const LinearGradient(
                      colors: [Colors.grey, Colors.blueGrey],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                    : const LinearGradient(
                      colors: [Color(0xFF007BFF), Color(0xFF00C6FF)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
            borderRadius: BorderRadius.circular(30),
          ),
          alignment: Alignment.center,
          child:
              isLoading
                  ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2.5,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        loadingText ?? 'جاري التحميل...',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  )
                  : Text(
                    text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
        ),
      ),
    );
  }
}
