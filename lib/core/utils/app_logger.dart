import 'package:logger/logger.dart';

class AppLogger {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2, // كم عدد الخطوات في Stacktrace
      errorMethodCount: 8, // عند الخطأ، كم خطوة تُظهر
      lineLength: 120, // طول السطر
      colors: true, // تلوين الرسائل
      printEmojis: true, // إظهار الرموز التعبيرية
    ),
  );

  static void d(String message) => _logger.d(message); // Debug
  static void i(String message) => _logger.i(message); // Info
  static void w(String message) => _logger.w(message); // Warning
  static void e(String message) => _logger.e(message); // Error
  static void f(String message) => _logger.f(message); // WTF (خطأ خطير)
}
