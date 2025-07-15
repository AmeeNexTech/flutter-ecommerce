class ApiEndpoints {
  static const String baseUrl = 'http://10.0.2.2:8000';
  // Auth endpoints
  static const String login = '/api/auth/login';
  static const String register = '/api/auth/register';
  static const String verifyOtp = '/api/auth/verify-registration-otp';
  static const String resendOtp = '/api/auth/resend-otp';
  static const String forgotPassword = '/api/auth/forgot-password';
  static const String verifyResetOtp = '/api/auth/verify-reset-otp';
  static const String resetPassword = '/api/auth/reset-password';
  static const String resendResetOtp = '/api/auth/resend-reset-otp';
  static const String deleteAccount = '/api/auth/delete-account';
  static const String healthCheck = '/api/health';
  static const String apiInfo = '/api/info';
}
