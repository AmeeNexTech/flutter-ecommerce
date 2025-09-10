import '../../../../core/constant/api_endpoints.dart';
import '../../../../core/services/network/dio_client.dart';
import '../../domain/entities/user_model.dart';
import 'package:get/get.dart';

abstract class IUserRemoteDataSource {
  Future<RegisterResponse> register({
    required String name,
    required String email,
    required String phoneNumber,
    required String password,
  });

  Future<VerifyOtpResponse> verifyOtp({
    required String email,
    required String otp,
  });

  Future<RegisterResponse> resendOtp({required String email});

  Future<LoginResponse> login({
    required String email,
    required String password,
  });

  Future<LogoutResponse> logout();

  Future<DeleteAccountResponse> deleteAccount({required String password});

  Future<ForgotPasswordResponse> forgotPassword({required String email});

  Future<VerifyResetOtpResponse> verifyResetOtp({
    required String email,
    required String otp,
  });

  Future<ForgotPasswordResponse> resendResetOtp({required String email});

  Future<ResetPasswordResponse> resetPassword({
    required String email,
    required String otp,
    required String password,
    required String passwordConfirmation,
  });
}

class UserRemoteDataSource implements IUserRemoteDataSource {
  final DioClient _dioClient = Get.find<DioClient>();

  @override
  Future<RegisterResponse> register({
    required String name,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    final response = await _dioClient.dio.post(
      ApiEndpoints.register,
      data: {
        'name': name,
        'email': email,
        'phone_number': phoneNumber,
        'password': password,
      },
    );
    return RegisterResponse.fromJson(response.data);
  }

  @override
  Future<VerifyOtpResponse> verifyOtp({
    required String email,
    required String otp,
  }) async {
    final response = await _dioClient.dio.post(
      ApiEndpoints.verifyOtp,
      data: {'email': email, 'otp': otp},
    );
    return VerifyOtpResponse.fromJson(response.data);
  }

  @override
  Future<RegisterResponse> resendOtp({required String email}) async {
    final response = await _dioClient.dio.post(
      ApiEndpoints.resendOtp,
      data: {'email': email},
    );
    return RegisterResponse.fromJson(response.data);
  }

  @override
  Future<LoginResponse> login({
    required String email,
    required String password,
  }) async {
    final response = await _dioClient.dio.post(
      ApiEndpoints.login,
      data: {'email': email, 'password': password},
    );
    return LoginResponse.fromJson(response.data);
  }

  @override
  Future<LogoutResponse> logout() async {
    final response = await _dioClient.dio.post(ApiEndpoints.logout);
    return LogoutResponse.fromJson(response.data);
  }

  @override
  Future<DeleteAccountResponse> deleteAccount({
    required String password,
  }) async {
    final response = await _dioClient.dio.post(
      ApiEndpoints.deleteAccount,
      data: {'password': password},
    );
    return DeleteAccountResponse.fromJson(response.data);
  }

  @override
  Future<ForgotPasswordResponse> forgotPassword({required String email}) async {
    final response = await _dioClient.dio.post(
      ApiEndpoints.forgotPassword,
      data: {'email': email},
    );
    return ForgotPasswordResponse.fromJson(response.data);
  }

  @override
  Future<VerifyResetOtpResponse> verifyResetOtp({
    required String email,
    required String otp,
  }) async {
    final response = await _dioClient.dio.post(
      ApiEndpoints.verifyResetOtp,
      data: {'email': email, 'otp': otp},
    );
    return VerifyResetOtpResponse.fromJson(response.data);
  }

  @override
  Future<ForgotPasswordResponse> resendResetOtp({required String email}) async {
    final response = await _dioClient.dio.post(
      ApiEndpoints.resendResetOtp,
      data: {'email': email},
    );
    return ForgotPasswordResponse.fromJson(response.data);
  }

  @override
  Future<ResetPasswordResponse> resetPassword({
    required String email,
    required String otp,
    required String password,
    required String passwordConfirmation,
  }) async {
    final response = await _dioClient.dio.post(
      ApiEndpoints.resetPassword,
      data: {
        'email': email,
        'otp': otp,
        'password': password,
        'password_confirmation': passwordConfirmation,
      },
    );
    return ResetPasswordResponse.fromJson(response.data);
  }
}
