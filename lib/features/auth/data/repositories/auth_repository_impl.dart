import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/utils/api_error_handler.dart';

import '../../../../core/error/failures.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/user_remote_datasource.dart';
import '../../domain/entities/user_model.dart';
import 'package:get/get.dart';

class AuthRepositoryImpl implements AuthRepository {
  final IUserRemoteDataSource _remoteDataSource =
      Get.find<IUserRemoteDataSource>();

  /// A helper method to execute a data source call and handle potential errors.
  /// It wraps the result in an [Either] type, returning a [Failure] on error
  /// or the success data [T] on success.
  Future<Either<Failure, T>> _getResponse<T>(
    Future<T> Function() getResponse,
  ) async {
    try {
      final response = await getResponse();
      return Right(response);
    } on DioException catch (e) {
      return Left(ServerFailure(ApiErrorHandler.handleError(e)));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, RegisterResponse>> register({
    required String name,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    return await _getResponse(
      () => _remoteDataSource.register(
        name: name,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
      ),
    );
  }

  @override
  Future<Either<Failure, VerifyOtpResponse>> verifyOtp({
    required String email,
    required String otp,
  }) async {
    return await _getResponse(
      () => _remoteDataSource.verifyOtp(email: email, otp: otp),
    );
  }

  @override
  Future<Either<Failure, RegisterResponse>> resendOtp({
    required String email,
  }) async {
    return await _getResponse(() => _remoteDataSource.resendOtp(email: email));
  }

  @override
  Future<Either<Failure, LoginResponse>> login({
    required String email,
    required String password,
  }) async {
    return await _getResponse(
      () => _remoteDataSource.login(email: email, password: password),
    );
  }

  @override
  Future<Either<Failure, LogoutResponse>> logout() async {
    return await _getResponse(() => _remoteDataSource.logout());
  }

  @override
  Future<Either<Failure, DeleteAccountResponse>> deleteAccount({
    required String password,
  }) async {
    return await _getResponse(
      () => _remoteDataSource.deleteAccount(password: password),
    );
  }

  @override
  Future<Either<Failure, ForgotPasswordResponse>> forgotPassword({
    required String email,
  }) async {
    return await _getResponse(
      () => _remoteDataSource.forgotPassword(email: email),
    );
  }

  @override
  Future<Either<Failure, VerifyResetOtpResponse>> verifyResetOtp({
    required String email,
    required String otp,
  }) async {
    return await _getResponse(
      () => _remoteDataSource.verifyResetOtp(email: email, otp: otp),
    );
  }

  @override
  Future<Either<Failure, ForgotPasswordResponse>> resendResetOtp({
    required String email,
  }) async {
    return await _getResponse(
      () => _remoteDataSource.resendResetOtp(email: email),
    );
  }

  @override
  Future<Either<Failure, ResetPasswordResponse>> resetPassword({
    required String email,
    required String otp,
    required String password,
    required String passwordConfirmation,
  }) async {
    return await _getResponse(
      () => _remoteDataSource.resetPassword(
        email: email,
        otp: otp,
        password: password,
        passwordConfirmation: passwordConfirmation,
      ),
    );
  }
}
