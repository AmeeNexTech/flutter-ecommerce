import 'package:dio/dio.dart';
import '../../../../core/constant/api_endpoints.dart';
import '../../../../core/services/network/dio_client.dart';
import '../../../../core/utils/api_error_handler.dart';
import '../../../model/auth/user_model.dart';
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
    try {
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
    } on DioException catch (e) {
      throw ApiErrorHandler.handleError(e);
    }
  }

  @override
  Future<VerifyOtpResponse> verifyOtp({
    required String email,
    required String otp,
  }) async {
    try {
      final response = await _dioClient.dio.post(
        ApiEndpoints.verifyOtp,
        data: {'email': email, 'otp': otp},
      );
      return VerifyOtpResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw ApiErrorHandler.handleError(e);
    }
  }

  @override
  Future<RegisterResponse> resendOtp({required String email}) async {
    try {
      final response = await _dioClient.dio.post(
        ApiEndpoints.resendOtp,
        data: {'email': email},
      );
      return RegisterResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw ApiErrorHandler.handleError(e);
    }
  }

  @override
  Future<LoginResponse> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dioClient.dio.post(
        ApiEndpoints.login,
        data: {'email': email, 'password': password},
      );
      return LoginResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw ApiErrorHandler.handleError(e);
    }
  }

  @override
  Future<LogoutResponse> logout() async {
    try {
      final response = await _dioClient.dio.post(ApiEndpoints.logout);
      return LogoutResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw ApiErrorHandler.handleError(e);
    }
  }

  @override
  Future<DeleteAccountResponse> deleteAccount({
    required String password,
  }) async {
    try {
      final response = await _dioClient.dio.post(
        ApiEndpoints.deleteAccount,
        data: {'password': password},
      );
      return DeleteAccountResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw ApiErrorHandler.handleError(e);
    }
  }
}
