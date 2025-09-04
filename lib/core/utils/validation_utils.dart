import 'package:get/get.dart';

String? validateEmail(String val) {
  val = val.trim();
  if (val.isEmpty) {
    return 'validation.email.empty'.tr;
  }
  if (!val.contains('@')) {
    return 'validation.email.missing_at'.tr;
  }
  if (!val.contains('.') || val.endsWith('.')) {
    return 'validation.email.missing_dot'.tr;
  }
  if (!GetUtils.isEmail(val)) {
    return 'validation.email.invalid_format'.tr;
  }
  return null;
}

String? validateUsername(String val) {
  val = val.trim();
  if (val.isEmpty) {
    return 'validation.username.empty'.tr;
  }
  if (val.length < 3) {
    return 'validation.username.too_short'.tr;
  }
  if (val.length > 20) {
    return 'validation.username.too_long'.tr;
  }
  if (!RegExp(r'^[a-zA-Z0-9_\u0600-\u06FF ]+$').hasMatch(val)) {
    return 'validation.username.invalid_chars'.tr;
  }
  return null;
}

String? validatePhone(String val) {
  val = val.trim();
  if (val.isEmpty) {
    return 'validation.phone.empty'.tr;
  }
  if (!RegExp(r'^[0-9]{11}$').hasMatch(val)) {
    return 'validation.phone.invalid_format'.tr;
  }
  return null;
}

String? validatePassword(String val) {
  val = val.trim();
  if (val.isEmpty) {
    return 'validation.password.empty'.tr;
  }
  if (val.length < 8) {
    return 'validation.password.too_short'.tr;
  }
  if (val.length > 32) {
    return 'validation.password.too_long'.tr;
  }
  if (!RegExp(r'[A-Z]').hasMatch(val)) {
    return 'validation.password.needs_uppercase'.tr;
  }

  if (!RegExp(r'[a-z]').hasMatch(val)) {
    return 'validation.password.needs_lowercase'.tr;
  }

  if (!RegExp(r'[0-9]').hasMatch(val)) {
    return 'validation.password.needs_number'.tr;
  }

  if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(val)) {
    return 'validation.password.only_letters_numbers'.tr;
  }
  return null;
}

String? validateConfirmPassword(String val, String originalPassword) {
  val = val.trim();
  if (val.isEmpty) {
    return 'validation.confirm_password.empty'.tr;
  }
  if (val != originalPassword.trim()) {
    {
      return 'validation.confirm_password.not_match'.tr;
    }
  }
  return null;
}
